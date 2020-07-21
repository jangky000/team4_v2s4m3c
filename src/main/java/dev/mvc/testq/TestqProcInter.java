package dev.mvc.testq;

import java.util.HashMap;
import java.util.List;

public interface TestqProcInter {
  /**
   * 등록
   * <xmp>
   *   <insert id="create" parameterType="TestqVO">
   * </xmp>
   * @param testqVO
   * @return
   */
  public int create(TestqVO testqVO);
  /**
   * 카테고리별 검색 레코드 갯수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param testqno 카테고리번호
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile,int testqno, int search_count,int nowPage);
  
  
  /**
   * <xmp>
   * 페이징 목록
   *  <select id="list_paging" resultType="TestqVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public List<TestqVO> list_paging(HashMap<String, Object> map);
  
  /**
   * 조회
   * <xmp>
   *   <select id="read" resultType="TestqVO" parameterType="int">
   * </xmp>
   * @param testqno
   * @return
   */
    public TestqVO read(int testqno);
    
    /**
     * 수정 처리
     * <xmp>
     *   <update id="update" parameterType="TestqVO">
     * </xmp>
     * @param testqVO
     * @return
     */
    public int update(TestqVO testqVO);
    
    /**
     * 삭제
     * <xmp>
     *   <delete id="delete" parameterType="int">
     * </xmp>
     * @param testqno
     * @return
     */
    public int delete(int testqno);
    
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
