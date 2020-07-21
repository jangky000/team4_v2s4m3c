package dev.mvc.event;

import java.util.HashMap;
import java.util.List;



public interface EventProcInter {
  /**
   * 등록
   * <xmp>
   *   <insert id="create" parameterType="EventVO">
   * </xmp>
   * @param eventVO
   * @return
   */
  public int create(EventVO eventVO);
  
  /**
   * 목록 
   * <xmp>
   * <select id="list" resultType="EventVO">
   * </xmp>
   * @return
   */
  public List<EventVO> list();
  
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param eventno 카테고리번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile,int eventno, int search_count,int nowPage);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list" resultType="EventVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<EventVO> list_paging(HashMap<String, Object> map);
  
  /**
   * <xmp>
   *  <select id="read" resultType="EventVO" parameterType="int">
   * </xmp>
   * @param eventno
   * @return
   */
  public EventVO read(int eventno);

  
  /**
   * 수정 처리
   * @param eventVO
   * @return
   */
  public int update(EventVO eventVO);
  
  /**
   * 패스워드 검사
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap hashMap);
  
  /**
   * 삭제
   * @param eventno
   * @return
   */
  public int delete(int eventno);
  
  /**
   * <xmp>
   *   이미지 등록, 수정, 삭제
      <update id="jpg" parameterType="HashMap">
   * </xmp> 
   * @param hashMap
   * @return
   */
  public int jpg(HashMap<Object, Object> hashMap);
  
  
}
