//package com.oracle.web.test;
//
//import static org.junit.Assert.*;
//
//import java.io.IOException;
//import java.io.InputStream;
//import java.util.Arrays;
//import java.util.List;
//
//import org.apache.ibatis.io.Resources;
//import org.apache.ibatis.session.SqlSession;
//import org.apache.ibatis.session.SqlSessionFactory;
//import org.apache.ibatis.session.SqlSessionFactoryBuilder;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//
//import com.github.pagehelper.PageHelper;
//import com.oracle.web.bean.Monster;
//import com.oracle.web.bean.MonsterExample;
//import com.oracle.web.bean.MonsterExample.Criteria;
//import com.oracle.web.mapper.MonsterMapper;
//
//public class TestMybatis {
//
//	private SqlSession session;
//	
//	private SqlSessionFactory sqlSessionFactory;
//	
//	private MonsterMapper monsterMapper;
//
//	@Before
//	public void init() throws IOException {
//
//		// 1.加载主配置文件
//
//		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
//
//		// 2.创建SqlSessionFactory
//
//		sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
//
//		// 3.开启会话SqlSession
//
//		session = sqlSessionFactory.openSession();
//
//		// 4.获得一个Mapper接口的对象
//
//		monsterMapper = session.getMapper(MonsterMapper.class);
//	}
//	
//	@Test
//	public void testAll(){
//		
//		MonsterExample example=new MonsterExample();
//		
//		//设置条件
//		
//		example.setOrderByClause("email desc");//添加升序排列条件，DESC为降序  
//		
//		example.setDistinct(true);//是否去除重复行 boolean类型，true为选择不重复的记录 
//		
//		//复杂条件
//		
//		Criteria criteria = example.createCriteria();
//		
//		//criteria.andMonsterIdIn(Arrays.asList(12,10,4,2));
//		
//		//criteria.andMnameLike("%蜘蛛%");//模糊查
//		
//		//分页
//		
//		PageHelper.startPage(2,4);
//		
//		List<Monster> list = monsterMapper.selectByExample(example);
//		
//		for (Monster monster : list) {
//			
//			System.out.println(monster);
//		}
//	}
//	
//	@After
//	public void destory() {
//
//		// 6.提交事物
//
//		session.commit();
//
//		// 7.关闭会话
//
//		session.close();
//	}
//
//}
