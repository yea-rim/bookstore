package com.trio.bookstore.repository2;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.trio.bookstore.entity.LibInfoDto;
import com.trio.bookstore.error.CannotFindException;

@Repository
public class LibInfoDaoImpl implements LibInfoDao {

   @Autowired
   private SqlSession sqlSession;

   @Override
   public List<LibInfoDto> list() {
      return sqlSession.selectList("lib-info.list");
   }

   @Override
   public LibInfoDto insert(LibInfoDto libinfoDto) {
      sqlSession.insert("lib-info.insert", libinfoDto);
      return libinfoDto;
   }

   @Override
   public LibInfoDto update(LibInfoDto libinfoDto) {
      int count = sqlSession.update("lib-info.update", libinfoDto);
      if (count == 0)
         throw new CannotFindException();
      return sqlSession.selectOne("lib-info.one", libinfoDto.getLibInfoNo());
   }

   @Override
   public void delete(int libInfoNo) {
      sqlSession.delete("lib-info.delete", libInfoNo);
   }

   @Override
   public List<LibInfoDto> search(String query) {
      return sqlSession.selectList("lib-info.search", query);
   }

   @Override
   public List<LibInfoDto> findLib(int libInfoNo) {
      return sqlSession.selectList("lib-info.findLib", libInfoNo);
   }

}