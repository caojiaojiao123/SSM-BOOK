package com.oracle.web.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.junit.runners.Parameterized.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.oracle.utils.DownUtils;
import com.oracle.web.bean.Book;
import com.oracle.web.bean.BookAndFenlei;
import com.oracle.web.bean.Fenlei;
import com.oracle.web.bean.PageBean;

import com.oracle.web.service.BookService;
import com.oracle.web.service.FenleiService;

@Controller
@Scope(value = "prototype")
public class BookHandler {

	@Autowired
	private BookService bookService;

	@Autowired
	private FenleiService fenleiService;

	// 全查分页
	// showBookHandler
	@RequestMapping(value = "/showBookHandler/{pageNow}", method = RequestMethod.GET)
	public String showPasgeMonster(@PathVariable(value = "pageNow") Integer pageNow, HttpServletRequest request) {
		// System.out.println("访问页数" + pageNow);

		if (pageNow == null || pageNow < 1) {
			pageNow = 1;
		}

		PageBean<BookAndFenlei> pb = this.bookService.showBookPesgeAll(pageNow);
		/*
		 * List<BookAndFenlei> list = pb.getBeanList();
		 * 
		 * for (BookAndFenlei bookAndFenlei : list) {
		 * System.out.println(bookAndFenlei.toString()); }
		 */
		// selectFenleiAll();
		List<Fenlei> flist = this.fenleiService.list();

		request.setAttribute("flist", flist);
		request.setAttribute("pb", pb);
		request.setAttribute("showPesge", "showBook");// 控制页面跳转

		return "showBook";

	}

	// 高级搜索
	@RequestMapping(value = "/GaoJiSs", method = RequestMethod.GET)
	public String GaoJiSs(Book book, @RequestParam(value = "pageNow") Integer pageNow, HttpServletRequest request) {
		if (pageNow == null || pageNow < 1) {
			pageNow = 1;
		}
		PageBean<BookAndFenlei> pb = this.bookService.showBookPesgeGaoJi(pageNow, book);

		List<BookAndFenlei> list = pb.getBeanList();
		String url = this.getUrl2(request);
		pb.setUrl(url);
		List<Fenlei> flist = this.fenleiService.list();
		request.setAttribute("flist", flist);
		request.setAttribute("pb", pb);
		request.setAttribute("showPesge", "gao");// 控制页面跳转

		return "showBook";
	}

	private String getUrl2(HttpServletRequest req) {
		// TODO Auto-generated method stub
		String url = this.getUrl(req);
		int index = url.lastIndexOf("&pageNow=");
		if (index == -1) {
			return url;
		}
		url = url.substring(0, index);
		System.out.println(url);
		return url;
	}

	private String getUrl(HttpServletRequest req) {
		// TODO Auto-generated method stub
		String path = req.getContextPath();
		System.out.println(path);
		String servlet = req.getServletPath();
		System.out.println(servlet);
		String param = req.getQueryString();
		System.out.println(param);
		System.out.println(path + servlet + "?" + param);
		return path + servlet + "?" + param;
	}

	// 添加图书校验
	@RequestMapping(value = "/yanzhengAddBook", method = RequestMethod.GET)
	public void yanzhengAddBook(@RequestParam(value = "name") String name, @RequestParam(value = "f_id") String f_id,
			HttpServletResponse response) throws IOException {
		// 调用service进行查询
		// System.out.println(userName);
		response.setContentType("text/html;charset=UTF-8");
		Book b = this.bookService.yanzhengAddBook(name, f_id);

		// System.out.println(existUser);
		// 获取response对象，向页面输出信息

		// 判断是否为空
		if (b == null) {
			// 分类下图书不经存在，可以添加
			// 有异常则向上抛出
			response.getWriter().write("{\"valid\":\"true\"}");
		} else {
			// 分类下图书已存在，不能添加

			response.getWriter().write("{\"valid\":\"false\"}");

		}
		// AJAX操作，不需要页面跳转

	}

	// 添加图书界面,分类遍历
	@RequestMapping(value = "/addBookUl", method = RequestMethod.GET)
	public String addBookUl(HttpServletRequest request) {
		List<Fenlei> flist = this.fenleiService.list();

		request.setAttribute("flist", flist);

		for (Fenlei fenlei : flist) {
			System.out.println(fenlei.getFname());
		}

		return "addbook";

	}

	// 添加图书
	// 转发forward:/.... 重定向:redirect:/...
	@RequestMapping(value = "/addBook", method = RequestMethod.POST)
	public String addBook(Book book) {
		// System.out.println(monster.toString());
		int i = this.bookService.save(book);
		if (i == 1) {
			return "redirect:/showBookHandler/1";
		} else {
			return "forward:/addBookUl";
		}

	}

	// 删除图书
	@RequestMapping(value = "/deleteBook/{ids}/{pageNow}", method = RequestMethod.DELETE)
	public String delete(@PathVariable(value = "ids") String ids, @PathVariable(value = "pageNow") Integer pageNow) {
		// System.out.println(ids);
		this.bookService.deleteBook(ids);
		return "redirect:/showBookHandler/" + pageNow;

	}

	// 修改图书界面
	@RequestMapping(value = "/updateBookUl/{id}/{pageNow}", method = RequestMethod.GET)
	public String updateUl(@PathVariable(value = "id") Integer id, @PathVariable(value = "pageNow") Integer pageNow,
			HttpServletRequest request) {// 妖怪

		List<Fenlei> flist = this.fenleiService.list();
		request.setAttribute("flist", flist);
		Book b = this.bookService.updateBookUl(id);
		// System.out.println(b.toString());
		request.setAttribute("b", b);
		return "changeBook";

	}

	// 实现修改图书
	@RequestMapping(value = "/updateBook", method = RequestMethod.PUT)
	public String update(Book book, @RequestParam(value = "pageNow") Integer pageNow) {

		// System.out.println(monster.toString());
		this.bookService.updateBook(book);

		return "redirect:/showBookHandler/" + pageNow;
	}

	// 验证修改图书
	@RequestMapping(value = "/yzupdateBook", method = RequestMethod.GET)
	public void yzUpdateBook(@RequestParam(value = "name") String name, @RequestParam(value = "f_id") String f_id,
			@RequestParam(value = "id") Integer id, HttpServletResponse response) throws IOException {
		// 调用service进行查询
		// System.out.println(userName);
		response.setContentType("text/html;charset=UTF-8");
		Book b = this.bookService.yanzhengAddBook(name, f_id);

		// System.out.println(b.toString());
		// 获取response对象，向页面输出信息

		// 判断是否为空
		if (b == null) {
			// bid 一样没改变是一本书 ，可修改
			// b没空 该分类下没有该图书可添加

			response.getWriter().write("{\"valid\":\"true\"}");
		} else if (b.getF_id().equals(id)) {
			response.getWriter().write("{\"valid\":\"true\"}");
		} else {
			// 分类下图书已存在，不能添加

			response.getWriter().write("{\"valid\":\"false\"}");

		}
		// AJAX操作，不需要页面跳转

	}

	// 6.选择导出图书
	@RequestMapping(value = "/outSelect/{ids}", method = RequestMethod.GET)
	public String outSelect(@PathVariable("ids") String ids, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		String[] arr = ids.split(",");
		List<Book> list = this.bookService.showUserByIds(arr);
		String key = "勾选";

		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("图书信息表");

		HSSFSheet sheet2 = workbook.createSheet();
		// 设置单元格的宽度：：
		sheet.setColumnWidth(4, 16 * 256);
		

		// 设置表头样式/颜色/对齐方式

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体颜色

		font.setBold(true);

		font.setColor(HSSFFont.COLOR_RED);

		style.setFont(font);
		
//		// 创建一个样式对象：：
//		HSSFCellStyle style = workbook.createCellStyle();
//		// style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中：：
//		HSSFFont font = workbook.createFont();// 设置字体样式：
//		font.setBold(true);
//		font.setColor(HSSFColor.BLUE.index);// 设置字体的颜色：
//		style.setFont(font);// 一定要写到style中！！！

		String[] title = { "编号", "姓名", "价格", "出版社", "状态", "借出人", "库存" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellValue(title[i]);

		}

		// 4.去数据库里查出user

		// List<user> list = userServicefactory.getuserServiceImpl().showUser();

		// 要几行？
		HSSFCellStyle style2 = workbook.createCellStyle();

		// style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book user1 = list.get(i);// 这是每个单元格设置：：

			HSSFCell cell1 = row2.createCell(0);
			// cell1.setCellStyle(style2);

			cell1.setCellValue(user1.getId());

			HSSFCell cell2 = row2.createCell(1);
			/// cell2.setCellStyle(style2);//这些都是设置单元格格式：：

			cell2.setCellValue(user1.getName());

			HSSFCell cell3 = row2.createCell(2);
			cell3.setCellStyle(style2);

			cell3.setCellValue(user1.getPrice());

			HSSFCell cell4 = row2.createCell(3);
			cell4.setCellStyle(style2);

			cell4.setCellValue(user1.getChubanshe());

			HSSFCell cell5 = row2.createCell(4);
			cell5.setCellStyle(style2);

			cell5.setCellValue(user1.getZhuangtai());

			HSSFCell cell6 = row2.createCell(5);
			cell6.setCellStyle(style2);// 这些都是设置单元格格式：：

			cell6.setCellValue(user1.getUsername());

			HSSFCell cell7 = row2.createCell(6);
			cell7.setCellStyle(style2);// 这些都是设置单元格格式：：

			cell7.setCellValue(user1.getKucun());

			// HSSFCell cell8 = row2.createCell(7);
			// cell8.setCellStyle(style2);
			//
			// cell8.setCellValue(user1.getF_id());

		}
		// 内存，把数据输出到硬盘
		File f = new File("person1.xls");//

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面重点重点！！！！！

		// outputStream.close();不关他
		// 响应到浏览器：：
		String file = f.getName();// 拿到名字person1.xls;
		file = new String(file.getBytes("ISO-8859-1"), "utf-8");
		String mime = request.getSession().getServletContext().getMimeType(file);

		String filename = DownUtils.filenameEncoding(key + f.getName(), request);

		String disposition = "attachment;filename=" + filename;// 不需要处理中文：：

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		response.setHeader("Content-Type", mime);

		response.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = response.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);// 响应给浏览器：：

		return null;
	}

	@RequestMapping(value = "/outAll", method = RequestMethod.GET)
	public String outAll(HttpServletRequest request, HttpServletResponse response) throws IOException {
		List<Book> list = this.bookService.showUser();// 导入全部信息：
		String key = "全部";
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("图书信息表");

		HSSFSheet sheet2 = workbook.createSheet();
		// 设置单元格的宽度：：
		sheet.setColumnWidth(4, 16 * 256);
		// 创建一个样式对象：：

		// 设置表头样式/颜色/对齐方式

		HSSFCellStyle style = workbook.createCellStyle();

		style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中

		HSSFFont font = workbook.createFont();// 设置字体颜色

		font.setBold(true);

		font.setColor(HSSFFont.COLOR_RED);

		style.setFont(font);
//		HSSFCellStyle style = workbook.createCellStyle();
//		// style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中：：
//		HSSFFont font = workbook.createFont();// 设置字体样式：
//		font.setBold(true);
//		font.setColor(HSSFColor.BLUE.index);// 设置字体的颜色：
//		style.setFont(font);// 一定要写到style中！！！

		String[] title = { "编号", "姓名", "价格", "出版社", "状态", "借出人", "库存" };

		HSSFRow row = sheet.createRow(0);// 从0开始,第一行

		for (int i = 0; i < title.length; i++) {

			HSSFCell cell = row.createCell(i);// 0 1 2 3 4

			cell.setCellValue(title[i]);

		}

		// 4.去数据库里查出user

		// List<user> list = userServicefactory.getuserServiceImpl().showUser();

		// 要几行？
		HSSFCellStyle style2 = workbook.createCellStyle();

		// style2.setAlignment(HSSFCellStyle.ALIGN_CENTER);

		for (int i = 0; i < list.size(); i++) {// 循环几次创建几行

			HSSFRow row2 = sheet.createRow(i + 1);// 从第二行开始 1 2 3 4 5

			Book user1 = list.get(i);// 这是每个单元格设置：：

			HSSFCell cell1 = row2.createCell(0);
			// cell1.setCellStyle(style2);

			cell1.setCellValue(user1.getId());

			HSSFCell cell2 = row2.createCell(1);
			/// cell2.setCellStyle(style2);//这些都是设置单元格格式：：

			cell2.setCellValue(user1.getName());

			HSSFCell cell3 = row2.createCell(2);
			cell3.setCellStyle(style2);

			cell3.setCellValue(user1.getPrice());

			HSSFCell cell4 = row2.createCell(3);
			cell4.setCellStyle(style2);

			cell4.setCellValue(user1.getChubanshe());

			HSSFCell cell5 = row2.createCell(4);
			cell5.setCellStyle(style2);

			cell5.setCellValue(user1.getZhuangtai());

			HSSFCell cell6 = row2.createCell(5);
			cell6.setCellStyle(style2);// 这些都是设置单元格格式：：

			cell6.setCellValue(user1.getUsername());

			HSSFCell cell7 = row2.createCell(6);
			cell7.setCellStyle(style2);// 这些都是设置单元格格式：：

			cell7.setCellValue(user1.getKucun());

			// HSSFCell cell8 = row2.createCell(7);
			// cell8.setCellStyle(style2);
			//
			// cell8.setCellValue(user1.getF_id());

		}
		// 内存，把数据输出到硬盘
		File f = new File("person1.xls");//

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面重点重点！！！！！

		// outputStream.close();不关他
		// 响应到浏览器：：
		String file = f.getName();// 拿到名字person1.xls;
		file = new String(file.getBytes("ISO-8859-1"), "utf-8");
		String mime = request.getSession().getServletContext().getMimeType(file);

		String filename = DownUtils.filenameEncoding(key + f.getName(), request);

		String disposition = "attachment;filename=" + filename;// 不需要处理中文：：

		// 设置两个响应头信息即可 (两个头)，告诉浏览器，我这个东西是下载的

		response.setHeader("Content-Type", mime);

		response.setHeader("Content-DisPosition", disposition);

		// 一个流 （两个流）

		// 把文件加载到内存

		InputStream inputStream = new FileInputStream(file);

		// 把流输出给浏览器

		ServletOutputStream out = response.getOutputStream();

		// 复制

		IOUtils.copy(inputStream, out);// 响应给浏览器：：

		return null;
	}

	// /**
	// * 导出
	// *
	// * @param request
	// * @return
	// * @throws IOException
	// */
	// // @GetMapping("/export")
	// @RequestMapping(value = "/export", method = RequestMethod.GET)
	// public ResponseEntity<byte[]> exportStudent(HttpServletRequest request)
	// throws IOException {
	// File file = bookService.exportStudent();
	// HttpHeaders headers = new HttpHeaders();
	// // 下载显示的文件名，解决中文名称乱码问题
	//
	// String downloadFilelName = new String(file.getName().getBytes("UTF-8"),
	// "iso-8859-1");
	// // 通知浏览器以attachment（下载方式）打开图片
	// headers.setContentDispositionFormData("attachment", downloadFilelName);
	// // application/octet-stream ： 二进制流数据（最常见的文件下载）。
	// headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
	// return new ResponseEntity<byte[]>(FileUtils.readFileToByteArray(file),
	// headers, HttpStatus.CREATED);
	// }
}
