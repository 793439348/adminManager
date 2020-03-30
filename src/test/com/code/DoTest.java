package com.code;

import admin.domains.content.dao.MerchantBrandDao;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *
 * </p>
 *
 * @author: zeng
 * @since: 2020-03-26
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:config/spring/spring-config.xml")
@Transactional
public class DoTest {

    @Autowired
    MerchantBrandDao brandDao;

    @Test
    public void test() {
        brandDao.findAll();
    }


    @Test
    public void test2() {



    }


    @Test
    public void testdao1() {
    }

    @Test
    public void testdao2() {
    }
    @Test
    public void testdao3() {
    }

    @Test
    public void testdao4() {
    }


}
