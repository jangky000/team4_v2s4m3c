package dev.mvc.itemgrp;

import java.util.List;

public interface ItemgrpDAOInter {
  
  /**
   * 등록 C 
   * <xmp>
   * <insert id="create" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return 등록된 레코드 갯수
   */
  public int create(ItemgrpVO itemgrpVO);
  
  /**
   * 목록 
   * <xmp>
   * <select id="list"  resultType="ItemgrpVO">
   * </xmp>
   * @return 레코드 목록
   */
  public List<ItemgrpVO> list();
  
  /**
   * 조회 R
   * <xmp>
   * <select id="read" resultType="ItemgrpVO" parameterType="int">
   * </xmp>
   * @param grpno
   * @return ItemgrpVO
   */
  public ItemgrpVO read(int grpno);
  
  /**
   * 수정 U
   * <xmp>
   * <update id="update" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return
   */
  public int update(ItemgrpVO itemgrpVO);
  
  /**
   * 삭제 D
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int delete(int grpno);

  /**
   * 출력 순서 상향
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int update_seqno_up(int grpno);
  
  /**
   * 출력 순서 하향
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int update_seqno_down(int grpno);
  
  /**
   * visible 수정
   * <xmp>
   * <update id="update_visible" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return
   */
  public int update_visible(ItemgrpVO itemgrpVO);

 
  
  
  
  
  
  
  

}
