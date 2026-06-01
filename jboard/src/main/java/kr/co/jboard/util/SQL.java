package kr.co.jboard.util;

public class SQL {
	// Article
	public static final String INSERT_ARTICLE = "INSERT INTO Article SET "
																		+ "type='free',"
																		+ "title=?,"
																		+ "content=?,"
																		+ "writer=?,"
																		+ "regip=?,"
																		+ "wdate=NOW()";
	public static final String SELECT_ARTICLE = "SELECT * FROM Article WHERE ano=?";
	public static final String SELECT_ALL_ARTICLE = "SELECT * FROM Article";
	public static final String UPDATE_ARTICLE = "UPDATE ARTICLE SET "
																	+ "title=?,"
																	+ "content=? "
																	+ "WHERE ano=?";
	public static final String DELETE_ARTICLE = "DELETE FROM ARTICLE WHERE ano=?";
	
	// User
	public static final String INSERT_USER = "INSERT INTO User SET "
																	+ "userid=?,"
																	+ "pass=?,"
																	+ "name=?,"
																	+ "nick=?,"
																	+ "email=?,"
																	+ "hp=?,"
																	+ "zip=?,"
																	+ "addr1=?,"
																	+ "addr2=?,"
																	+ "regip=?,"
																	+ "rdate=NOW(),"
																	+ "leaveDate=NULL";
	public static final String SELECT_USER = "SELECT * FROM User WHERE userid=?";
	public static final String SELECT_ALL_USER = "SELECT * FROM User";
	public static final String UPDATE_USER = "UPDATE User SET "
															+ "pass=?,"
															+ "name=?,"
															+ "nick=?,"
															+ "email=?,"
															+ "hp=?,"
															+ "zip=?,"
															+ "addr1=?,"
															+ "addr2=?,"
															+ "WHERE userid=?";
	public static final String DELETE_USER = "DELETE FROM User WHERE userid=?";
	
	// File
	public static final String INSERT_FILE = "INSERT INTO";
	public static final String SELECT_FILE = "";
	public static final String SELECT_ALL_FILE = "";
	public static final String UPDATE_FILE = "";
	public static final String DELETE_FILE = "";
	
	// Comment
	public static final String INSERT_COMMENT = "INSERT INTO Comment SET "
																		+ "parent=?,"
																		+ "content=?,"
																		+ "writer=?,"
																		+ "regip=?,"
																		+ "wdate=NOW()";
	public static final String SELECT_COMMENT = "SELECT * FROM Comment WHERE cno=?";
	public static final String SELECT_ALL_COMMENT = "SELECT * FROM Comment";
	public static final String UPDATE_COMMENT = "UPDATE Comment SET "
																	+ "content=? "
																	+ "WHERE cno=?";
	public static final String DELETE_COMMENT = "DELETE FROM Comment WHERE cno=?";
	
	// Terms
	public static final String INSERT_TERMS = "INSERT INTO Terms SET "
																	+ "basic=?,"
																	+ "privacy=?";
	public static final String SELECT_TERMS = "SELECT * FROM Terms WHERE no=?";
	public static final String SELECT_ALL_TERMS = "SELECT * FROM Terms";
	public static final String UPDATE_TERMS = "UPDATE Terms SET "
																+ "basic=?,"
																+ "privacy=? "
																+ "WHERE no=?";
	public static final String DELETE_TERMS = "DELETE FROM Terms WHERE no=?";
}
