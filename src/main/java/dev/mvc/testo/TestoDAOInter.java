package dev.mvc.testo;

import java.util.List;

public interface TestoDAOInter {
  /**
   * 등록
   * <insert id="create" parameterType="TestoVO">
   * @param testoVO
   * @return
   */
  public int create(TestoVO testoVO);
  
  /**
   * 조회
   * @param testono
   * @return
   */
  public TestoVO read(int testono);
  
  

  /**
   * 목록
   *   <select id="list" resultType="TestoVO">
   * @return
   */
  public List<TestoVO> list();
  
  

  /**
   * 
   *   <select id="list_by_testqno" resultType="TestoVO">
   * @return
   */
  public List<TestoVO>list_by_testqno(int testqno);
  
  /**
   * 수정
   * @param testoVO
   * @return
   */
  public int update(TestoVO testoVO);
  
  
  /**
   * 우선순위 상향, up 10 ▷ 1
   * @param cateno
   * @return
   */
  public int update_seqno_up(int testono);
  
  /**
   * 우선순위 하향, up 10 ▷ 1
   * @param cateno
   * @return
   */
  public int update_seqno_down(int testono);
  
  /**
   * 삭제
   * @param testono
   * @return
   */
  public int delete(int testono);
  
  /**
   * <xmp>
   *  통합 VO 기반 join
   *  <select id="list_join" resultType="Testq_Testo_join"> 
   * </xmp>
   * @return
   */
  public List<Testq_Testo_join> list_join();  
  

}
