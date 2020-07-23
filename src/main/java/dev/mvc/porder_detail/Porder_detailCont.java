package dev.mvc.porder_detail;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.porder.PorderProcInter;
import dev.mvc.porder.PorderVO;
import dev.mvc.porder.Porder_detail_itemVO;


@Controller
public class Porder_detailCont {

	@Autowired
	@Qualifier("dev.mvc.porder.PorderProc")
	private PorderProcInter porderProc;

	@Autowired
	@Qualifier("dev.mvc.porder_detail.Porder_detailProc")
	private Porder_detailProcInter porder_detailProc;

	public Porder_detailCont() {
		System.out.println("--> Porder_detailCont created.");
	}

	// �ʿ� ����
	//http://localhost:9090/team4/porder_detail/create.do
	/**
	 * ��� ��
	 * @return
	 */
	@RequestMapping(value="/porder_detail/create.do", method=RequestMethod.GET )
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/porder_detail/create"); // webapp/porder/create.jsp
		return mav;
	}


	// �ʿ� ����
	//http://localhost:9090/team4/porder/payment.do
	/**
	 * ��� ��, ��ٱ��� ����Ʈ���� �Ѿ��
	 * @return
	 */
	@RequestMapping(value="/porder_detail/create.do", method=RequestMethod.POST )
	public ModelAndView payment(String[] shopping_cartno, Porder_detailVO porder_detailVO) {
		ModelAndView mav = new ModelAndView();
		// ��� �����ϱ� �ؾ��� ��, ���ε� �ʿ��� ��, ��굵 �ٽ��ؾ� �� ��
		mav.addObject("shopping_cartlist", shopping_cartno);
		mav.addObject("porder_detailVO", porder_detailVO);
		mav.setViewName("/porder_detail/create"); // webapp/porder/create.jsp
		return mav;
	}

	//http://localhost:9090/team4/porder_detail/list_admin.do
	/**
	 * ����Ʈ
	 * @return
	 */
	@RequestMapping(value="/porder_detail/list_admin.do", method=RequestMethod.GET )
	public ModelAndView list_admin(@RequestParam(value="porderno", defaultValue="0") int porderno) {
		ModelAndView mav = new ModelAndView();

		if(porderno == 0) {
			List<Porder_detailVO> list = this.porder_detailProc.list();
			mav.addObject("list", list);
		}else {
			List<Porder_detailVO> list = this.porder_detailProc.list_by_porderno(porderno);
			mav.addObject("list", list);
		}

		mav.setViewName("/porder_detail/list_admin"); // webapp/porder_detail/list_admin.jsp
		return mav;
	}

	//http://localhost:9090/team4/porder_detail/list_detail.do
	/**
	 * ����Ʈ
	 * @return
	 */
	@RequestMapping(value="/porder_detail/list_detail.do", method=RequestMethod.GET )
	public ModelAndView list_detail(int porderno) {
		ModelAndView mav = new ModelAndView();

		List<Porder_detailVO> list = this.porder_detailProc.list_by_porderno(porderno);
		mav.addObject("list", list);

		mav.setViewName("/porder_detail/list_detail"); // webapp/porder_detail/list_admin.jsp
		return mav;
	}

	// ����� ���
	// http://localhost:9090/team4/delivery/list_seller.do
	/**
	 * ����� ��� ��
	 * @return
	 */
	@RequestMapping(value="/delivery/list_seller.do", method=RequestMethod.GET )
	public ModelAndView list_seller(HttpSession session) {
		ModelAndView mav = new ModelAndView();

		// ��� N
		// �̸�, ����ó
		//int memno = (Integer)session.getAttribute("memno");
		int memno = 1;
		// �ֹ� ���̺� N 
		// �ֹ���ȣ, �����, ������

		// ��ǰ ���̺� N * M
		// ��ǰ �̸�, ��ǰ, ���

		// �ֹ� �� ���̺� N * M
		// ��ǰ, ����
		List<Porder_detail_itemVO> join_list = this.porderProc.list_join_porder_detail_item(memno);
		mav.addObject("list", join_list);
		List<PorderVO> porder_list = this.porderProc.list();
		mav.addObject("porder_cnt", porder_list.size());
		List<Porder_detailVO> detail_list = this.porder_detailProc.list();
		mav.addObject("detail_cnt", detail_list.size());
		//mav.addObject("list", detail_list);

		// REST ������̺� ����
		// ��ۻ���, ���� ó����

		mav.setViewName("/delivery/list_seller"); // webapp/porder_detail/list_seller.jsp
		return mav;
	}

	//http://localhost:9090/team4/delivery/update_trackingno.do
	/**
	 * ������Ʈ ó��, ����� ��ȣ �߰�
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/delivery/update_trackingno.do", method=RequestMethod.POST, produces="text/plain;charset=UTF-8" )
	public String update_trackingno(int porder_detailno, int trackingno){
		JSONObject result = new JSONObject();

		System.out.println("porder_detailno: " + porder_detailno);
		System.out.println("trackingno: " + trackingno);

		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("porder_detailno", porder_detailno);
		//    if(trackingno == -1) {
		//      map.put("trackingno", ""); // ibatis���� ó���ϴ� null ������ �ٲ���
		//      result.put("trackingno", ""); // JSON������ null ��
		//    }
		//    else {
		//      map.put("trackingno", trackingno);
		//      result.put("trackingno", trackingno);
		//    }

		map.put("trackingno", trackingno);
		result.put("trackingno", trackingno);

		int cnt = this.porder_detailProc.update_trackingno(map);

		result.put("cnt", cnt);


		return result.toString(); // forward
	}

}
