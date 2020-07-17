package dev.mvc.coupon;

import java.util.HashMap;
import java.util.List;

public interface CouponProcInter {
  
  /**
   * <xmp>
   *  ���� ���
   * <insert id="create" parameterType="CouponVO">
   * <xmp>
   * @return
   */
  public int create(CouponVO couponVO);

  /**
   * <xmp>
   *  ���� ���
   * <select id="list" resultType="CouponVO">
   * <xmp>
   * @return
   */
  public List<CouponVO> list();

  /**
   * <xmp>
   *  ���� ��ȸ
   * <select id="read" resultType="CouponVO" parameterType="int">
   * <xmp>
   * @return
   */
  public CouponVO read(int couponno);

  /**
   * ����
   */

  /**
   * <xmp>
   *  ���� ����: ���� ���� -> ��� 0�̸� �߱� �Ұ�
   * <delete id="delete" parameterType="int">
   * <xmp>
   * @return
   */
  public int delete(int couponno);
  
  /**
   * ���� ��ü ���ڵ� ����
   * @param hashMap
   * @return
   */
  public int search_count();
  
  /** 
   * SPAN�±׸� �̿��� �ڽ� ���� ����, 1 ���������� ���� 
   * ���� ������: 11 / 22   [����] 11 12 13 14 15 16 17 18 19 20 [����] 
   *
   * @param listFile ��� ���ϸ� 
   * @param search_count �˻�(��ü) ���ڵ�� 
   * @param nowPage     ���� ������
   * @return ����¡ ���� ���ڿ�
   */ 
  public String pagingBox(String listFile, int search_count, int nowPage);
  
  /**
   * ���� ��ȣ�� ����¡
   * @param map
   * @return
   */
  public List<CouponVO> list_by_couponno_paging(HashMap<String, Object> map);
  
}
