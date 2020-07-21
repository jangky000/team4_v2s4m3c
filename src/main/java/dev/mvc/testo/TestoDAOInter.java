package dev.mvc.testo;

import java.util.List;

public interface TestoDAOInter {
  /**
   * ���
   * <insert id="create" parameterType="TestoVO">
   * @param testoVO
   * @return
   */
  public int create(TestoVO testoVO);
  
  /**
   * ��ȸ
   * @param testono
   * @return
   */
  public TestoVO read(int testono);
  
  

  /**
   * ���
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
   * ����
   * @param testoVO
   * @return
   */
  public int update(TestoVO testoVO);
  
  
  /**
   * �켱���� ����, up 10 �� 1
   * @param cateno
   * @return
   */
  public int update_seqno_up(int testono);
  
  /**
   * �켱���� ����, up 10 �� 1
   * @param cateno
   * @return
   */
  public int update_seqno_down(int testono);
  
  /**
   * ����
   * @param testono
   * @return
   */
  public int delete(int testono);
  
  /**
   * <xmp>
   *  ���� VO ��� join
   *  <select id="list_join" resultType="Testq_Testo_join"> 
   * </xmp>
   * @return
   */
  public List<Testq_Testo_join> list_join();  
  

}
