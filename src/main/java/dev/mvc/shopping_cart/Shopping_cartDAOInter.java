package dev.mvc.shopping_cart;

import java.util.HashMap;
import java.util.List;

public interface Shopping_cartDAOInter {
  
  /**
   * <xmp>
   * ��ٱ��� ���
   * <insert id="create" parameterType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public int create(Shopping_cartVO shopping_cartVO);

  /**
   * <xmp>
   * ��ٱ��� ���
   * <select id="list" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
  public List<Shopping_cartVO> list();

  /**
   * <xmp>
   * ȸ���� ���ε� ��ٱ��� ���
   * <select id="list_join" resultType="Shopping_cartVO">
   * <xmp>
   * @param memno : ȸ�� ���� ��ȣ
   * @return
   */
  public List<Shop_item_grpVO> list_join(int memno);
  
  /**
   * <xmp>
   * ���� �� ���õ� ����īƮno ��ȸ
   * <select id="list_by_selected_shopping_cartno" resultType="Shopping_cartVO">
   * <xmp>
   * @return
   */
//  public List<Shopping_cartVO> list_by_selected_shopping_cartno(int[] shopping_cartInt);
  
  /**
   * <xmp>
   * ���õ� ����īƮno ��ȸ
   * <select id="list_join_by_selected_shopping_cartno" resultType="Shop_item_grpVO" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public List<Shop_item_grpVO> list_join_by_selected_shopping_cartno(HashMap<Object, Object> map);
  
  /**
   * <xmp>
   * ��ٱ��� ��ȸ
   * <select id="read" resultType="Shopping_cartVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Shopping_cartVO read(int shopping_cartno);
  
  
  /**
   * <xmp>
   * ��ٱ��� �ߺ�üũ
   * <select id="shopping_cart_check" resultType="String" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public String shopping_cart_check(HashMap<Object, Object> map);
  
  
  /**
   * <xmp>
   * ��ٱ��� ��ǰ ���� 1 ����
   * <update id="quantity_up" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_up(int shopping_cartno);
  
  /**
   * <xmp>
   * ��ٱ��� ��ǰ Ư�� ���� ����
   * <update id="quantity_up_num" parameterType="HashMap">
   * <xmp>
   * @return
   */
  public int quantity_up_num(HashMap map);
  
  /**
   * <xmp>
   * ��ٱ��� ��ǰ ���� ����
   * <update id="quantity_down" parameterType="int">
   * <xmp>
   * @return
   */
  public int quantity_down(int shopping_cartno);
  
  /**
   * <xmp>
   * ��ٱ��� ����
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int shopping_cartno);

  /**
   * <xmp>
   * �������� ��ٱ��� ����
   * <delete id="delete_list" parameterType="int">
   * <foreach collection="shopping_cartInt" item="shopping_cartno" open="" close="" separator=" OR ">
   * </xmp>
   */
  public int delete_list(int[] shopping_cartInt);
}
