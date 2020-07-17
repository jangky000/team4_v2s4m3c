package dev.mvc.coupon_use;

import java.util.HashMap;
import java.util.List;

import dev.mvc.coupon.CouponVO;

public interface Coupon_useProcInter {
  /**
   * <xmp>
   *  ���� ��� ���
   * <insert id="create" parameterType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public int create(int porderno, int coupon_issueno, String cpstatus);

  /**
   * <xmp>
   *  ���� ��� ���
   * <select id="list" resultType="Coupon_useVO">
   * <xmp>
   * @return
   */
  public List<Coupon_useVO> list();

  /**
   * <xmp>
   *  ���� ��� ��ȸ
   * <select id="read" resultType="Coupon_useVO" parameterType="int">
   * <xmp>
   * @return
   */
  public Coupon_useVO read(int coupon_useno);

  /**
   * ����
   */

  /**
   * <xmp>
   *  ���� ��� ����: ���� ��� ����, ���º��� -- ���:U, ���:C
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int coupon_useno);
  
  /**
   * ���� ��� ��� ��
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /**
   * ����¡ �ڽ�
   * @param listFile
   * @param search_count
   * @param nowPage
   * @return
   */
  public String pagingBox(String listFile, int search_count, int nowPage);
  
  /**
   * ���� ��� ����¡ ���
   * @param map
   * @return
   */
  public List<CouponVO> list_by_coupon_useno_paging(HashMap<String, Object> map);
}
