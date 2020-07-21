package dev.mvc.itemgrp;

import java.util.List;

public interface ItemgrpDAOInter {
  
  /**
   * ��� C 
   * <xmp>
   * <insert id="create" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return ��ϵ� ���ڵ� ����
   */
  public int create(ItemgrpVO itemgrpVO);
  
  /**
   * ��� 
   * <xmp>
   * <select id="list"  resultType="ItemgrpVO">
   * </xmp>
   * @return ���ڵ� ���
   */
  public List<ItemgrpVO> list();
  
  /**
   * ��ȸ R
   * <xmp>
   * <select id="read" resultType="ItemgrpVO" parameterType="int">
   * </xmp>
   * @param grpno
   * @return ItemgrpVO
   */
  public ItemgrpVO read(int grpno);
  
  /**
   * ���� U
   * <xmp>
   * <update id="update" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return
   */
  public int update(ItemgrpVO itemgrpVO);
  
  /**
   * ���� D
   * <xmp>
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int delete(int grpno);

  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int update_seqno_up(int grpno);
  
  /**
   * ��� ���� ����
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param grpno
   * @return
   */
  public int update_seqno_down(int grpno);
  
  /**
   * visible ����
   * <xmp>
   * <update id="update_visible" parameterType="ItemgrpVO">
   * </xmp>
   * @param itemgrpVO
   * @return
   */
  public int update_visible(ItemgrpVO itemgrpVO);

 
  
  
  
  
  
  
  

}
