package boss.income.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import boss.income.bean.IncomeBean;
import boss.income.bean.IncomeOptionBean;
import boss.income.dao.IncomeDaoImpl;

@Controller
public class IncomeController {

	@Autowired
	private IncomeDaoImpl incomeService;

	
	/* 다른 페이지에서 '소득' 버튼을 눌렀을 때 매핑되는 메서드 */
	@RequestMapping(value = "/list.io")
	public String income_Boardlist(HttpServletRequest request, HttpServletResponse response, HttpSession session) {

		return "income/income_main";
	}

	/*테이블 새로고침용 메서드*/
	@RequestMapping(value = "/list2.io", method = RequestMethod.POST)
	public void getIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		int root_idn = (int) session.getAttribute("root_Idn");
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().write(getIncome_JSON(root_idn));
	}

	/*DB에서 테이블 정보를 읽어와서 JSON 형태로 변환해주는 메서드*/
	public String getIncome_JSON(int root_idn) {
		StringBuffer str = new StringBuffer("");
		str.append("{\"result\":[");
		

		List<IncomeBean> list = incomeService.getAllIncomeList(root_idn);

		for (int i = 0; i < list.size(); i++) {
			str.append("[{\"value\": \"" + list.get(i).getIncome_Id() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getIncome_Date() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getIncome_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getTrade_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getAsset_Code() + "\"},");
			str.append("{\"value\": \"" + list.get(i).getIncome_Amount() + "\"},");

			if (i == list.size() - 1) {

				str.append("{\"value\": \"" + list.get(i).getIncome_Description() + "\"}]");
			} else {
				str.append("{\"value\": \"" + list.get(i).getIncome_Description() + "\"}],");
			}
		}
		str.append("]}");

		System.out.println(str);

		return str.toString();
	}

	/*DB에 저장하는 메서드*/
	@RequestMapping(value = "/addIncomeList.io", method = RequestMethod.POST)
	public void addIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "arrData[]") List<String> arrayData) {
		IncomeBean bean = new IncomeBean();
		
		String incomeName = incomeService.getIncomeName(arrayData.get(1));
		String assetCode = incomeService.getAssetCode(arrayData.get(3));
		String tradeCode = incomeService.getTradeCode(arrayData.get(2));

		bean.setIncome_Date(java.sql.Date.valueOf(arrayData.get(0)));
		bean.setIncome_Code(incomeName);
		bean.setTrade_Code(tradeCode);
		bean.setAsset_Code(assetCode);
		bean.setIncome_Amount(Integer.parseInt(arrayData.get(4)));
		bean.setIncome_Description(arrayData.get(5));

		incomeService.addIncomeList(bean);
	}

	/*DB 삭제 메서드*/
	@RequestMapping(value = "/delIncomeList.io", method = RequestMethod.POST)
	public void delIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "income_Id") String data) {
		int dataToInt = Integer.parseInt(data);
		incomeService.delIncomeList(dataToInt);
	}

	/*DB 수정 메서드*/
	@RequestMapping(value = "/modifyIncomeList.io", method = RequestMethod.POST)
	public void modifyIncome_list(HttpServletRequest request, HttpServletResponse response, HttpSession session,
			@RequestParam(value = "arrData[]") List<String> arrayData, @RequestParam(value = "income_Id") String data) {

		int dataToInt = Integer.parseInt(data);

		System.out.println("root_idn = " + dataToInt);
		IncomeBean bean = new IncomeBean();
		String incomeName = incomeService.getIncomeName(arrayData.get(1));
		String assetCode = incomeService.getAssetCode(arrayData.get(3));
		String tradeCode = incomeService.getTradeCode(arrayData.get(2));

		System.out.println("tradeCode :" + tradeCode);

		bean.setIncome_Id(data);
		bean.setIncome_Date(java.sql.Date.valueOf(arrayData.get(0)));
		bean.setIncome_Code(incomeName);
		bean.setTrade_Code(tradeCode);
		bean.setAsset_Code(assetCode);
		bean.setIncome_Amount(Integer.parseInt(arrayData.get(4)));
		bean.setIncome_Description(arrayData.get(5));

		incomeService.updateImcomeList(bean);
	}

	/*테이블 selectbox 내용물을 불러오는 메서드*/
	@RequestMapping(value = "/getOptions.io", method = RequestMethod.GET)
	public void getOptions(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		int root_Idn = 1;
		List<IncomeOptionBean> list = this.incomeService.getIncomeOptions(root_Idn);
		JSONArray cash = new JSONArray();
		JSONArray account = new JSONArray();

		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).getTrade_Code().equals("cash")) {
				cash.add(list.get(i).getAsset_Name());
			} else {
				account.add(list.get(i).getAsset_Name());
			}
		}

		JSONObject obj = new JSONObject();

		obj.put("cash", cash);
		obj.put("account", account);

		response.getWriter().write(obj.toString());

	}
}
