package dev.mvc.shopping_cart;

import java.util.HashMap;
import java.util.List;

public interface Shopping_cartDAOInter {
  
  /**
   * <xmp>
   * 장바구니 등록
   * <insert id="create" parameterType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public int create(Shopping_cartVO shopping_cartVO);

  /**
   * <xmp>
   * 장바구니 목록
   * <select id="list" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public List<Shopping_cartVO> list();

  /**
   * <xmp>
   * 회원별 조인된 장바구니 목록
   * <select id="list_join" resultType="Shopping_cartVO">
   * <xmp>
   * @param memno : 회원 고유 번호
   * @return
   */
  public List<Shop_item_grpVO> list_join(int memno);
  
  /**
   * <xmp>
   * 결제 시 선택된 쇼핑카트no 조회
   * <select id="list_by_selected_shopping_cartno" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
//  public List<Shopping_cartVO> list_by_selected_shopping_cartno(int[] shopping_cartInt);
  
  /**
   * <xmp>
   * 선택된 쇼핑카트no 조회
   * <select id="list_join_by_selected_shopping_cartno" resultType="Shop_item_grpVO" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public List<Shop_item_grpVO> list_join_by_selected_shopping_cartno(HashMap<Object, Object> map);
  
  /**
   * <xmp>
   * 장바구니 조회
   * <select id="read" resultType="Shopping_cartVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Shopping_cartVO read(int shopping_cartno);
  
  
  /**
   * <xmp>
   * 장바구니 중복체크
   * <select id="shopping_cart_check" resultType="String" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public String shopping_cart_check(HashMap<Object, Object> map);
  
  
  /**
   * <xmp>
   * 장바구니 상품 개수 1 증가
   * <update id="quantity_up" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_up(int shopping_cartno);
  
  /**
   * <xmp>
   * 장바구니 상품 특정 개수 증가
   * <update id="quantity_up_num" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public int quantity_up_num(HashMap map);
  
  /**
   * <xmp>
   * 장바구니 상품 개수 감소
   * <update id="quantity_down" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_down(int shopping_cartno);
  
  /**
   * <xmp>
   * 장바구니 삭제
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int shopping_cartno);

  /**
   * <xmp>
   * 동적으로 장바구니 삭제
   * <delete id="delete_list" parameterType="int">
   * <foreach collection="shopping_cartInt" item="shopping_cartno" open="" close="" separator=" OR ">
   * </xmp>
   */
  public int delete_list(int[] shopping_cartInt);
}
