package com.model;

public class ScoreCard {
	
	private String name;
	private String totalQuestion;
	private String category;
	private String difficulty;
	private String correctQuestion;
	private String incorrectQuestion;
	private String percentage;
	private String grade;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTotalQuestion() {
		return totalQuestion;
	}
	public void setTotalQuestion(String totalQuestion) {
		this.totalQuestion = totalQuestion;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getDifficulty() {
		return difficulty;
	}
	public void setDifficulty(String difficulty) {
		this.difficulty = difficulty;
	}
	public String getCorrectQuestion() {
		return correctQuestion;
	}
	public void setCorrectQuestion(String correctQuestion) {
		this.correctQuestion = correctQuestion;
	}
	public String getIncorrectQuestion() {
		return incorrectQuestion;
	}
	public void setIncorrectQuestion(String incorrectQuestion) {
		this.incorrectQuestion = incorrectQuestion;
	}
	public String getPercentage() {
		return percentage;
	}
	public void setPercentage(String percentage) {
		this.percentage = percentage;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}

}
