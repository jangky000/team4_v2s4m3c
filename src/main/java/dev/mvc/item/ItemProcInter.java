package dev.mvc.item;

import java.util.HashMap;
import java.util.List;

public interface ItemProcInter {

  /**
   * 상품 등록
   * <xmp>
   *  <insert id="create" parameterType="ItemVO">
   * </xmp>
   * @param itemVO
   * @return
   */
  public int create(ItemVO itemVO);
  
  /**
   * <xmp>
   *   <select id="list" resultType="ItemVO" parameterType="int">
   * </xmp>
   * @return
   */
  public List<ItemVO> list();
  
  /**
   * <xmp>
   * 전체 게시글 갯수
   * <select id="total_count" resultType="int">
   * </xmp>
   * @return
   */
  public int total_count();
  
  /**
   * <xmp>
   *  itemgrp + item inner join,  1 : 다, 통합 VO
   * <select id="list_join" resultType="Itemgrp_Item_join" parameterType="int">
   * </xmp>
   * @return
   */
  public List<Itemgrp_Item_join> list_join();
  
  /**
   * <xmp>
   *  grpno 별 item 목록: itemgrp + item inner join,  1 : 다, 통합 VO
   *  <select id="list_join_by_grpno" resultType="Itemgrp_Item_join" parameterType="int">
   * </xmp>
   */
  public List<Itemgrp_Item_join> list_join_by_grpno(int grpno);
  
  /**
   * <xmp>
   * 전체 카테고리 목록
   *  <resultMap type="Itemgrp_Item_VO" id="Itemgrp_Item_VO_Map">
   *                                      ↑                                    ↑
   *                       ┌────┘                                    └──┐                 
   *                       │                                                            │          
   *                       │      <select id="list_all" resultMap="Itemgrp_Item_VO_Map">
   * public List<Itemgrp_Item_VO> list_all();
   * </xmp>
   * @return
   */
  public List<Itemgrp_Item_VO> list_all();
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param grpno 카테고리번호
   * @param total_count 총 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int grpno, int total_count, int nowPage);
   
  /**
   * <xmp>
   * 페이징 목록
   * </xmp>
   * @param map
   * @return
   */
  public List<Itemgrp_Item_join> list_by_grpno_paging(HashMap<String, Object> map);
  
  /**
   * <xmp
   * <select id="read" resultType="ItemVO" parameterType="int">
   * </xmp>
   * @return
   */
  public ItemVO read(int itemno);
  
  /**
   * <xmp>
   * <update id="update" parameterType="ItemVO">
   * </xmp>
   * @param itemVO
   * @return
   */
  public int update(ItemVO itemVO);
  
  /**
   * <xmp>
   * <update id="update_image" parameterType="ItemVO">
   * </xmp>
   * @param itemVO
   * @return
   */
  public int update_image(ItemVO itemVO);
  
  /**
   * <xmp>
   * <delete id="delete"  parameterType="int">
   * </xmp>
   * @param itemno
   * @return
   */
  public int delete(int itemno);
  
  /**
   * <xmp>
   * <update id="update_seqno_up" parameterType="int">
   * </xmp>
   * @param itemno
   * @return
   */
  public int update_seqno_up(int  itemno);
  
  /**
   * <xmp>
   * <update id="update_seqno_down" parameterType="int">
   * </xmp>
   * @param itemno
   * @return
   */
  public int update_seqno_down(int  itemno);
  
  /**
   * <xmp>
   * <update id="update_visible" parameterType="int">
   * </xmp>
   * @param itemno
   * @return
   */
  public int update_visible(ItemVO itemVO);
  
  
  
}
