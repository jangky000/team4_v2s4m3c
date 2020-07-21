package dev.mvc.recommand;

import java.util.List;

public interface RecomDAOInter {

  /**
   * 화장품 추천 등록 C 
   * <xmp>
   * <insert id="create" parameterType="recomVO">
   * </xmp>
   * @param recomVO
   * @return
   */
  public int create(RecomVO recomVO);
  
  /**
   * 화장품 추천 리스트 List
   * <xmp>
   * <select id="list" resultType="recomVO">
   * </xmp>
   * @return
   */
  public List<RecomVO> list();

  /**
   * 화장품 추천 조회 R
   * <xmp>
   * <select id="read" resultType="recomVO" parameterType="int">
   * </xmp>
   * @param recomno
   * @return
   */
  public RecomVO read(int recomno);
  
  /**
   * 화장품 추천 업데이트 U
   * <xmp>
   *  <update id="update" parameterType="ItemVO">
   * </xmp>
   * @param recomVO
   * @return
   */
  public int update(RecomVO recomVO);
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}
