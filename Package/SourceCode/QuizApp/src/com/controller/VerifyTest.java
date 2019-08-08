package com.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.ScoreCard;

@WebServlet("/VerifyTest")
public class VerifyTest extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
    private int totalQuestion;
    private String username;
    private int category;
    private String difficulty;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		totalQuestion = Integer.parseInt(request.getParameter("totalQuestion"));
		username = request.getParameter("username");
		category = Integer.parseInt(request.getParameter("category"));
		difficulty = request.getParameter("difficulty");
		
		int cntTrue=0;
		int cntFalse=0;
		for(int i=1;i<=totalQuestion;i++)
		{
			if(request.getParameter(i+"").equals("1"))
				cntTrue++;
			else
				cntFalse++;
		}
		float avg = (cntTrue*100)/totalQuestion;
		
//		If the average of marks is >= 80 then Grade ‘A’
//		If the average is <80 and >=60 then Grade ‘B’
//		If the average is <60 and >=40 then Grade ‘C’
//		else prints Grade ‘D’
				
		String grade="";
		if(avg>=80)
        {
			grade="A";
        }
        else if(avg>=60 && avg<80)
        {
        	grade="B";
        } 
        else if(avg>=40 && avg<60)
        {
        	grade="C";
        }
        else
        {
        	grade="D";
        }
		writeCSVFile(request, username,String.valueOf(totalQuestion), getCategoryNameByCatId(category), difficulty, String.valueOf(cntTrue), String.valueOf(cntFalse), String.valueOf(avg), grade);
		
		ScoreCard scoreCard = new ScoreCard();
		scoreCard.setName(username);
		scoreCard.setTotalQuestion(String.valueOf(totalQuestion));
		scoreCard.setCategory(getCategoryNameByCatId(category));
		scoreCard.setDifficulty(difficulty);
		scoreCard.setCorrectQuestion(String.valueOf(cntTrue));
		scoreCard.setIncorrectQuestion(String.valueOf(cntFalse));
		scoreCard.setPercentage(String.valueOf(avg));
		scoreCard.setGrade(grade);
		
		List<ScoreCard> list = new ArrayList<>();
		list.add(scoreCard);
		request.setAttribute("username", username);
		request.setAttribute("scoreCard", list);
		request.getRequestDispatcher("viewScoreCards.jsp").forward(request, response);
	}

	void writeCSVFile(HttpServletRequest request, String name,String totalQuestion, String category, String difficulty, String correntQue, String incorrentQue, String percentage, String grade)
	{
		FileWriter csvWriter = null;
		List<List<String>> rows = Arrays.asList(Arrays.asList(name,totalQuestion, category, difficulty, correntQue, incorrentQue, percentage, grade));
		List<List<String>> cols = Arrays.asList(Arrays.asList("Name", "Total Question", "Category", "Difficulty", "Correct Question", "Incorrect Question", "Percentage", "Grade"));
		
		try
		{
			File file = new File("OnlineTest.csv");
			System.out.println(file.exists());
			StringBuffer sb = new StringBuffer();
			if(!file.exists())
			{
				for (List<String> colsData : cols) {
					sb.append(String.join(",", colsData));
					sb.append("\n");
				}
			}
			
			csvWriter = new FileWriter(file, true);
			if(!sb.toString().trim().isEmpty())
				csvWriter.append(sb.toString());
			
			for (List<String> rowData : rows) {
			    csvWriter.append(String.join(",", rowData));
			    csvWriter.append("\n");
			}
			request.setAttribute("file", "Data successully write in the file.");
		} catch (Exception e) {
			System.err.println("CSV file writing failed.");
			request.setAttribute("file", "Data writing failed. " + e.getMessage());
		} finally {
			if(csvWriter!=null)
			{
				try {
					csvWriter.flush();
					csvWriter.close();
				} catch (Exception e) {
					System.err.println("Resouce closing failed of CSV file writer.");
					request.setAttribute("file", "Resouce closing failed of CSV file writer. "+e.getMessage());
				}
			}
		}
	
	}
	
	String getCategoryNameByCatId(int category)
	{
		Map<Integer,String> categoryList = new HashMap<>();
		categoryList.put(9,"General Knowledge");
		categoryList.put(10,"Entertainment: Books");
		categoryList.put(11,"Entertainment: Film");
		categoryList.put(12,"Entertainment: Music");
		categoryList.put(13,"Entertainment: Musicals & Theatres");
		categoryList.put(14,"Entertainment: Television");
		categoryList.put(15,"Entertainment: Video Games");
		categoryList.put(16,"Entertainment: Board Games");
		categoryList.put(17,"Science & Nature");
		categoryList.put(18,"Science: Computers");
		categoryList.put(19,"Science: Mathematics");
		categoryList.put(20,"Mythology");
		categoryList.put(21,"Sports");
		categoryList.put(22,"Geography");
		categoryList.put(23,"History");
		categoryList.put(24,"Politics");
		categoryList.put(25,"Art");
		categoryList.put(26,"Celebrities");
		categoryList.put(27,"Animals");
		categoryList.put(28,"Vehicles");
		categoryList.put(29,"Entertainment: Comics");
		categoryList.put(30,"Science: Gadgets");
		categoryList.put(31,"Entertainment: Japanese Anime & Manga");
		categoryList.put(32,"Entertainment: Cartoon & Animations");
		return categoryList.get(category);
	}
}
