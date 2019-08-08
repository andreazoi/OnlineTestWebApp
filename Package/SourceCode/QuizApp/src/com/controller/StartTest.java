package com.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.model.Response;

@WebServlet("/StartTest")
public class StartTest extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String username;
	private int category;
	private String difficulty;
	private Gson g = new Gson();
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		username = request.getParameter("name");
		category = Integer.parseInt(request.getParameter("category"));
		difficulty = request.getParameter("difficulty");
		request.setAttribute("name", username);
		request.setAttribute("category", category);
		request.setAttribute("difficulty", difficulty);
		String multipleQueResponse = getAPICallOfOpentDB(5,category,difficulty,"multiple");
		System.out.println("Response of multiple choice question : " + multipleQueResponse);
		int flagMultiple = 0;
		if(!multipleQueResponse.trim().isEmpty())
		{
			Response responseObj = g.fromJson(multipleQueResponse, Response.class);
			System.out.println("Response Code (Multiple) : "+responseObj.getResponseCode());
			if(responseObj.getResponseCode() == 0)
			{
				flagMultiple = 1;
				request.setAttribute("multipleQue", responseObj.getResults());
			}
		}
		int flagBoolean = 0;
		String booleanQueResponse = getAPICallOfOpentDB(5,category,difficulty,"boolean");
		System.out.println("Response of boolean question : " + booleanQueResponse);
		if(!booleanQueResponse.trim().isEmpty())
		{
			Response responseObj = g.fromJson(booleanQueResponse, Response.class);
			System.out.println("Response Code (Boolean) : "+responseObj.getResponseCode());
			if(responseObj.getResponseCode() == 0)
			{
				flagBoolean = 1;
				request.setAttribute("booleanQue", responseObj.getResults());
			}
		}
		if(flagMultiple==1 || flagBoolean==1)
		{	
			request.getRequestDispatcher("startExam.jsp").forward(request, response);
		}
		else
		{
			request.setAttribute("message", "Technical error occured. Try to contact system admin.");
			if(flagMultiple==0 && flagBoolean==0)
			{
				request.setAttribute("message", "Test not start based on selected category and difficulty. <br/> You can change your selection.");
			}
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	String getAPICallOfOpentDB(int totalQuestion, int category, String difficulty, String type)
	{
		HttpURLConnection con = null;
		BufferedReader in = null;
		StringBuffer response = new StringBuffer();
		try{
			String link = "https://opentdb.com/api.php?amount="+totalQuestion+"&category="+category+"&difficulty="+difficulty+"&type="+type;
			System.out.println(link);
			URL url = new URL(link);
			con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			int status = con.getResponseCode();
			System.out.println("Status code of response of multichoice question : " + status);
			if(status == 200) {
				in = new BufferedReader(new InputStreamReader(con.getInputStream()));
				String inputLine;
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
			}
		} catch (Exception e) {
			System.err.println("getMultiChoiceQuestion() : " + e.getMessage());
		} finally {
			try {
				if(in != null)
					in.close();
			} catch (Exception e) {
				System.err.println("Closing Buffered Reader : " + e.getMessage());
			}
			try {
				if(con != null)
					con.disconnect();
			} catch (Exception e) {
				System.err.println("Disconnecting connection : " + e.getMessage());
			}
		}
		return response.toString();
	}
}