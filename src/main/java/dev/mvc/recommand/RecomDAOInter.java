package dev.mvc.recommand;

import java.util.List;

public interface RecomDAOInter {

  /**
   * ȭ��ǰ ��õ ��� C 
   * <xmp>
   * <insert id="create" parameterType="recomVO">
   * </xmp>
   * @param recomVO
   * @return
   */
  public int create(RecomVO recomVO);
  
  /**
   * ȭ��ǰ ��õ ����Ʈ List
   * <xmp>
   * <select id="list" resultType="recomVO">
   * </xmp>
   * @return
   */
  public List<RecomVO> list();

  /**
   * ȭ��ǰ ��õ ��ȸ R
   * <xmp>
   * <select id="read" resultType="recomVO" parameterType="int">
   * </xmp>
   * @param recomno
   * @return
   */
  public RecomVO read(int recomno);
  
  /**
   * ȭ��ǰ ��õ ������Ʈ U
   * <xmp>
   *  <update id="update" parameterType="ItemVO">
   * </xmp>
   * @param recomVO
   * @return
   */
  public int update(RecomVO recomVO);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
