package com.controller;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ScoreCard;

@WebServlet("/ViewScoreCards")
public class ViewScoreCards extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private String username;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		username = request.getParameter("name");
		List<ScoreCard> list = new ArrayList<>();
		BufferedReader csvReader = null;
		
		try {
			csvReader = new BufferedReader(new FileReader("OnlineTest.csv"));
			csvReader.readLine();
			String row;
			while ((row = csvReader.readLine()) != null) {
			    String[] data = row.split(",");
			    if(data[0].trim().equalsIgnoreCase(username.trim()))
			    {
			    	ScoreCard scoreCard = new ScoreCard();
			    	scoreCard.setTotalQuestion(data[1]);
			    	scoreCard.setCategory(data[2]);
			    	scoreCard.setDifficulty(data[3]);
			    	scoreCard.setCorrectQuestion(data[4]);
			    	scoreCard.setIncorrectQuestion(data[5]);
			    	scoreCard.setPercentage(data[6]);
			    	scoreCard.setGrade(data[7]);
			    	list.add(scoreCard);
			    }
			}
		} catch (Exception e) {
			System.err.println("Reading CSV file failed.");
		} finally {
			
			try {
				if(csvReader!=null)
					csvReader.close();
			} catch (Exception e) {
				System.err.println("Resource closing failed of buffered reader.");
			}
		}
		request.setAttribute("username", username);
		request.setAttribute("scoreCard", list);
		request.getRequestDispatcher("viewScoreCards.jsp").forward(request, response);
	}

}
