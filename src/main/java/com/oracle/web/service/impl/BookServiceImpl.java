package com.oracle.web.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import com.oracle.web.bean.Book;
import com.oracle.web.bean.BookAndFenlei;
import com.oracle.web.bean.BookExample;
import com.oracle.web.bean.BookExample.Criteria;
import com.oracle.web.bean.PageBean;

import com.oracle.web.mapper.BookMapper;
import com.oracle.web.service.BookService;


@Service
public class BookServiceImpl implements BookService {
	//private static final Logger logger = LoggerFactory.getLogger(BookServiceImpl.class);
	@Autowired
	private BookMapper bookMapper;

	@Override // 全查分页图书
	@Transactional(readOnly = true)
	public PageBean<BookAndFenlei> showBookPesgeAll(Integer pageNow) {
		// TODO Auto-generated method stub
		PageBean<BookAndFenlei> pb = new PageBean<BookAndFenlei>();
		PageHelper.startPage(pageNow, 5);
		List<BookAndFenlei> list = this.bookMapper.selectBookAll();
		PageInfo<BookAndFenlei> page = new PageInfo<BookAndFenlei>(list);
		pb.setBeanList(list);
		pb.setPageSize(page.getPageSize());
		pb.setCounts((int) page.getTotal());// page.getTotal()查询总数
		pb.setPageNow(page.getPageNum());
		return pb;
	}

	@Override // 高级搜索图书
	@Transactional(readOnly = true)
	public PageBean<BookAndFenlei> showBookPesgeGaoJi(Integer pageNow, Book book) {
		// TODO Auto-generated method stub
		PageBean<BookAndFenlei> pb = new PageBean<BookAndFenlei>();
		PageHelper.startPage(pageNow, 5);

		System.out.println(book.toString());
		// name; money; press; author;stock;

		List<BookAndFenlei> list = this.bookMapper.selectByGji(book);
		PageInfo<BookAndFenlei> page = new PageInfo<BookAndFenlei>(list);
		pb.setBeanList(list);
		pb.setPageSize(page.getPageSize());
		pb.setCounts((int) page.getTotal());// page.getTotal()查询总数
		pb.setPageNow(page.getPageNum());
		return pb;
	}

	// 删除图书，根据id删除，多选删除
	@Override
	@Transactional
	public void deleteBook(String ids) {
		// TODO Auto-generated method stub
		String[] a = ids.split(",");

		Integer[] values = new Integer[a.length];
		for (int i = 0; i < a.length; i++) {

			values[i] = Integer.parseInt(a[i]);
		}
		// List<Integer> asList = Arrays.asList(values);

		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andIdIn(Arrays.asList(values));
		this.bookMapper.deleteByExample(example);
	}

	// 添加,修改图书校验
	@Override
	@Transactional
	public Book yanzhengAddBook(String name, String f_id) {
		// TODO Auto-generated method stub
		BookExample example = new BookExample();
		Criteria criteria = example.createCriteria();
		criteria.andFIdEqualTo(Integer.parseInt(f_id));
		criteria.andNameEqualTo(name);
		List<Book> list = this.bookMapper.selectByExample(example);
		Book book = null;
		for (Book book1 : list) {
			book = book1;
		}
		// System.out.println(book);
		return book;
	}

	// 添加图书
	@Override
	@Transactional
	public int save(Book book) {
		// TODO Auto-generated method stub
		return this.bookMapper.insert(book);
	}

	// 修改图书页面分类名查询
	@Override
	@Transactional
	public Book updateBookUl(Integer id) {
		// TODO Auto-generated method stub

		return this.bookMapper.selectByPrimaryKey(id);
	}

	// 修改图书
	@Override
	public void updateBook(Book book) {
		// TODO Auto-generated method stub
		this.bookMapper.updateByPrimaryKey(book);
	}

//	
//	private List<Book> buildStudentList(List<String[]> readExcelContent) {
//
//		List<Book> studentList = Lists.newArrayList();
//		readExcelContent.remove(0);// 删除第一行标示
//		readExcelContent.stream().forEach((items) -> {
//			// 不设置id
//			Book student = new Book();
//			// student.setId(Integer.valueOf(items[0]));
//			student.setName(items[1]);
//			// 判断年龄为数字;
//			int age = 0;
//			if (items[2] != null && NumberUtils.isNumber(items[2])) {
//				age = (int) Double.parseDouble(items[2]);
//			}
//			// student.setAge(age);
//			// student.setMajor(items[3]);
//			// student.setCreateTime(new Date());
//			studentList.add(student);
//		});
//		return studentList;
//	}

//	@Override
//	public File exportStudent() {
//		List<BookAndFenlei> studentList = bookMapper.selectBookAll();
//		try {
//			File file = ExcelUtils.exportExcel(studentList,
//					RequestUtils.getRequest().getSession().getServletContext().getRealPath(File.separator)
//							+ UUID.randomUUID().toString() + ".xls",
//					new String[] { "id", "名字", "年龄", "学科", "创建时间" }, "updateTime");
//			return file;
//		} catch (IOException e) {
//			logger.error(e.getMessage(), e.toString());
//		} catch (IllegalAccessException e) {
//			logger.error(e.getMessage(), e.toString());
//		}
//		return null;
//	}

	@Override
	public List<Book> showUser() {// 导入全部：
		// TODO Auto-generated method stub
		return this.bookMapper.selectAll2();
	}

	@Override
	public List<Book> showUserByIds(String[] arr) {
		// TODO Auto-generated method stub
		return this.bookMapper.showUserById(arr);
	}
//
//	@Override
//	public com.oracle.web.service.R importStudentExcel(MultipartFile file) {
//		// TODO Auto-generated method stub
//		return null;
//	}

}
