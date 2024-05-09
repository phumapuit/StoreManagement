package com.storeManagement.controller.web;

import com.storeManagement.config.Config;
import com.storeManagement.constant.SystemConstant;
import com.storeManagement.model.*;
import com.storeManagement.service.*;
import com.storeManagement.utils.FileUtil;
import com.storeManagement.utils.FormUtil;
import com.storeManagement.utils.SessionUtil;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet(urlPatterns = {"/trang-chu", "/gioi-thieu", "/cau-hoi-thuong-gap", "/tuyen-dung", "/dang-nhap", "/dang-ky", "/thoat", "/payment-result", "/404"})
public class HomeController extends HttpServlet {

	@Inject
	private IUserService userService;

	@Inject
	private ICategoryService categoryService;

	@Inject
	private IProductService productService;

	private ResourceBundle resourceBundle = ResourceBundle.getBundle("message");

	@Inject
	private IOrderDetailService orderDetailService;

	@Inject
	private IOrderService orderService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
				case "logout":
					logout(request, response);
					break;
				case "login":
					renderLoginPage(request, response);
					break;
				case "register":
					renderRegisterPage(request, response);
					break;
				case "introduce":
					renderIntroducePage(request, response);
					break;
				case "question":
					renderQuestionPage(request, response);
					break;
				case "hiring":
					renderHiringPage(request, response);
					break;
				case "payment":
					renderPaymentPage(request, response);
					break;
				case "404":
					render404Page(request, response);
					break;
				default:
					renderHomePage(request, response);
					break;
			}
		} else {
			renderHomePage(request, response);
		}
	}

	private void render404Page(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CategoryModel> categories = categoryService.findAll();
		request.setAttribute("categories", categories);

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/404.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if (action != null) {
			switch (action) {
				case "login":
					processLoginRequest(request, response);
					break;
				case "register":
					processRegisterRequest(request, response);
					break;
				default:
					renderHomePage(request, response);
					break;
			}
		} else {
			renderHomePage(request, response);
		}
	}

	private void renderHomePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("imagesBackground", FileUtil.imageBackground);

		List<CategoryModel> categories = categoryService.findAll();
		request.setAttribute("categories", categories);

		HashMap<String, List<ProductModel>> productCategoryMap = new HashMap<>();

		for (CategoryModel item : categories) {
			List<ProductModel> productList = productService.get4ProductByCategoryId(item.getId());
			productCategoryMap.put(String.valueOf(item.getId()), productList);
		}

		request.setAttribute("productCategoryMap", productCategoryMap);

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");
		rd.forward(request, response);
	}

	private void renderIntroducePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CategoryModel> categories = categoryService.findAll();
		request.setAttribute("categories", categories);

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/introduce.jsp");
		rd.forward(request, response);
	}

	private void renderQuestionPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CategoryModel> categories = categoryService.findAll();
		request.setAttribute("categories", categories);

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/question.jsp");
		rd.forward(request, response);
	}

	private void renderHiringPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<CategoryModel> categories = categoryService.findAll();
		request.setAttribute("categories", categories);

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/hiring.jsp");
		rd.forward(request, response);
	}

	private void renderLoginPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Render login page
		String alert = request.getParameter("alert");
		String message = request.getParameter("message");

		if (message != null && alert != null) {
			request.setAttribute("message", resourceBundle.getString(message));
			request.setAttribute("alert", alert);
		}

		RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
		rd.forward(request, response);
	}

	private void processLoginRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Process login request
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel model = userService.findByUserNameAndPassword(username, password);

		if (model != null) {
			SessionUtil.getInstance().putValue(request, "USERMODEL", model);
			request.setAttribute("_username", model.getUsername());
			redirectBasedOnRole(model.getRole().getRole_name(), request, response);
		} else {
			redirectToLoginWithError(request, response);
		}
	}

	private void renderRegisterPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Render register page

		String alert = request.getParameter("alert");
		String message = request.getParameter("message");
		if (message != null && alert != null) {
			request.setAttribute("message", resourceBundle.getString(message));
			request.setAttribute("alert", alert);
		}

		request.setAttribute("flag", SystemConstant.REGISTER);
		RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
		rd.forward(request, response);
	}

	private void processRegisterRequest(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// Process registration request
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		UserModel model = userService.findByUsername(username);

		if (model != null) {
			response.sendRedirect(request.getContextPath() + "/dang-ky?action=register&message=user_is_exists&alert=danger");
		} else {
			UserModel userModel = new UserModel();
			userModel.setUsername(username);
			userModel.setPassword(password);
			userService.save(userModel);
			response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login");
		}
	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws IOException {
		SessionUtil.getInstance().removeValue(request, "USERMODEL");
		response.sendRedirect(request.getContextPath() + "/trang-chu");
	}

	private void redirectBasedOnRole(String roleName, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if (roleName.equals(SystemConstant.USER)) {
			response.sendRedirect(request.getContextPath() + "/trang-chu");
		} else if (roleName.equals(SystemConstant.ADMIN)) {
			response.sendRedirect(request.getContextPath() + "/admin-product?type=list");
		}
	}

	private void redirectToLoginWithError(HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.sendRedirect(request.getContextPath() + "/dang-nhap?action=login&message=username_password_invalid&alert=danger");
	}

	private void renderPaymentPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//Begin process return from VNPAY
		Map fields = new HashMap();
		for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
			String fieldName = (String) params.nextElement();
			String fieldValue = request.getParameter(fieldName);
			if ((fieldValue != null) && (fieldValue.length() > 0)) {
				fields.put(fieldName, fieldValue);
			}
		}

		String vnp_SecureHash = request.getParameter("vnp_SecureHash");
		if (fields.containsKey("vnp_SecureHashType")) {
			fields.remove("vnp_SecureHashType");
		}
		if (fields.containsKey("vnp_SecureHash")) {
			fields.remove("vnp_SecureHash");
		}
		//String signValue = Config.hashAllFields(fields);

		String vnp_TxnRef = request.getParameter("vnp_TxnRef");

			// Thanh toan thanh cong
			if ("00".equals(request.getParameter("vnp_ResponseCode"))) {

				OrdersModel om = orderService.getOrderByTransactionId(vnp_TxnRef);
				// cap nhat trang thai thanh toan cua don hang
				List<OrdersDetailModel> ordersDetailModelList = orderDetailService.getOrderDetailByOrderId(om.getId());

				for (OrdersDetailModel odm :ordersDetailModelList) {
					ProductModel p = productService.findOne(odm.getProduct_id());
					// cap nhat lai so luong sau khi thanh toan thanh cong
					p.setProduct_quantity(p.getProduct_quantity() - odm.getQuantity());
					productService.update(p, String.valueOf(odm.getProduct_id()));
				}

				// cap nhat trang thai giao dich thanh cong cho order
				om.setStatus_payment(1);
				orderService.update(om,om.getId());

				// so tien da giao dich
				request.setAttribute("vnp_Amount", om.getSummary_order());

			} else {
				// giao dich khong thanh cong
				OrdersModel om = orderService.getOrderByTransactionId(vnp_TxnRef);

				om.setStatus_payment(2);
				orderService.update(om,om.getId());
			}

		// ma code ngan hang
		request.setAttribute("vnp_BankCode", request.getParameter("vnp_BankCode") == null ? "" : request.getParameter("vnp_BankCode"));
		// ma giao dich cua vnpay
		request.setAttribute("vnp_TxnRef", request.getParameter("vnp_TxnRef") == null ? "" : request.getParameter("vnp_TxnRef"));
		// thoi gian thuc hien giao dich
		request.setAttribute("vnp_PayDate", request.getParameter("vnp_PayDate") == null ? "" : request.getParameter("vnp_PayDate"));
		// ket qua giao dic
		request.setAttribute("vnp_ResponseCode", request.getParameter("vnp_ResponseCode") == null ? "" : request.getParameter("vnp_ResponseCode"));


		RequestDispatcher rd = request.getRequestDispatcher("/views/payment-result.jsp");
		rd.forward(request, response);
	}
}
