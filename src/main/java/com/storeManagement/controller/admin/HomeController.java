package com.storeManagement.controller.admin;

import com.storeManagement.model.CategoryModel;
import com.storeManagement.service.ICategoryService;
import com.storeManagement.service.IProductService;

import javax.inject.Inject;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.SortedMap;
import java.util.TreeMap;

@WebServlet(urlPatterns = {"/admin-home"})
public class HomeController extends HttpServlet {

	@Inject
	private IProductService productService;

	@Inject
	private ICategoryService categoryService;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		List<CategoryModel> categoryList = categoryService.findAll();

		// Create a SortedMap to hold the converted values
		SortedMap<String, String> categories = new TreeMap<>();

		// Populate the map
		for (CategoryModel category : categoryList) {
			categories.put(String.valueOf(category.getId()), category.getCategory_name());
		}

		request.setAttribute("categories", categories);
		request.setAttribute("products", productService.findAll());

		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/home.jsp");
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}
}
