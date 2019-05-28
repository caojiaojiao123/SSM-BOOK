package com.oracle.web.controller;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;

import com.oracle.web.factory.userServicefactory;
import com.oracle.web.utils.DownUtils;
import com.oracle.web.bean.Book;

/**
 * Servlet implementation class outputUserServlet
 */
public class outputUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = request.getParameter("action");
		List<Book> list = null;
		String key = "";

		if ("all".equals(action)) {
			list = userServicefactory.getuserServiceImpl().showUser();
			key = "全部";
		}
		if ("outselect".equals(action)) {
			String ids = request.getParameter("ids");// 字符串；
			String[] arr = ids.split(",");

			list = userServicefactory.getuserServiceImpl().showUserByIds(arr);//根据数组来判断的：：

			key = "勾选";
		} // 创建工作簿：：
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("用户信息表");

		HSSFSheet sheet2 = workbook.createSheet();
		// 设置单元格的宽度：：
		sheet.setColumnWidth(4, 16 * 256);
		// 创建一个样式对象：：
		HSSFCellStyle style = workbook.createCellStyle();
		//style.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 居中：：
		HSSFFont font = workbook.createFont();// 设置字体样式：
		font.setBold(true);
		font.setColor(HSSFColor.BLUE.index);// 设置字体的颜色：
		style.setFont(font);// 一定要写到style中！！！

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

		}
		// 内存，把数据输出到硬盘
		File f = new File("person1.xls");//

		OutputStream outputStream = new FileOutputStream(f);

		workbook.write(outputStream);// 把工作簿的内容输出到person.xls里面重点重点！！！！！

		// outputStream.close();不关他
		// 响应到浏览器：：
		String file = f.getName();// 拿到名字person1.xls;
		file = new String(file.getBytes("ISO-8859-1"), "utf-8");
		String mime = request.getServletContext().getMimeType(file);

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

	}

}
