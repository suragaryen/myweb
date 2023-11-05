package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO { //Data Access Object  

    
    private DBOpen dbopen = null;
    private Connection con = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;
    private StringBuilder sql = null;
    
    public BbsDAO() {
    	dbopen = new DBOpen();
    
    }// end
    
    
    
    public int create(BbsDTO dto) {
        int cnt = 0; //성공 또는 실패 여부 반환
        try {
            con = dbopen.getConnection(); //오라클 데이터베이스 연결
            
            sql = new StringBuilder();
            sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
            sql.append(" VALUES(bbs_seq.nextval, ?, ?, ?, ?, ?,(select nvl(max(bbsno),0)+1 from tb_bbs)) ");
            
            pstmt = con.prepareStatement(sql.toString());
            pstmt.setString(1, dto.getWname());
            pstmt.setString(2, dto.getSubject());        
            pstmt.setString(3, dto.getContent());         
            pstmt.setString(4, dto.getPasswd());         
            pstmt.setString(5, dto.getIp());         
            
            
            cnt = pstmt.executeUpdate();
            
        }catch (Exception e) {
            System.out.println("추가 실패:" + e);
        }finally {
            DBClose.close(con, pstmt);
        }//end
        return cnt;
    }//create() end
    
    
    public ArrayList<BbsDTO> list() {
    	
    	ArrayList<BbsDTO> list = null;
    	
    	try {
    		con = dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		
    		sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
    		sql.append(" FROM tb_bbs ");
    		sql.append(" ORDER BY grpno DESC, ansnum ASC ");
    		
    		pstmt = con.prepareStatement(sql.toString());
    		rs = pstmt.executeQuery(); 
    		
    		if(rs.next()) {
    			
    			list = new ArrayList<BbsDTO>();
    			
    			do {
    				BbsDTO dto = new BbsDTO();// 한줄담기
    				dto.setBbsno(rs.getInt("bbsno"));
    				dto.setWname(rs.getString("wname"));
    				dto.setSubject(rs.getString("subject"));
    				dto.setReadcnt(rs.getInt("readcnt"));
    				dto.setRegdt(rs.getString("regdt"));
    				dto.setIndent(rs.getInt("indent"));
    				
    				list.add(dto); //list에 모으기
    			}while(rs.next());
    		}//if end
    		
    	}catch(Exception e) {
    		System.out.println("전체목록실패: " + e);
    		
    	}finally {
    		DBClose.close(con, pstmt, rs);
    	}//end
    	
    	return list;
    	
    	
    }//list
    
    public int count() {
    	int cnt = 0;
    	try {
    		con=dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		sql.append(" SELECT COUNT(*) as cnt ");
    		sql.append(" FROM tb_bbs");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			cnt=rs.getInt("cnt");
    		}//if end
    	
    	}catch (Exception e) {
    		System.out.println("글 갯수 실패 : " + e);
    	}finally{
    		DBClose.close(con, pstmt, rs);
    	}//end
    	
    	return cnt;
    	
    }//count() end
    
    
    
    public BbsDTO read(int bbsno) {
    	BbsDTO dto = null;
    	try {
    		con=dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		sql.append(" SELECT bbsno, wname, subject, content, readcnt, regdt, ip, grpno, indent, ansnum  ");
    		sql.append(" FROM tb_bbs ");
    		sql.append(" WHERE bbsno=? ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1, bbsno);
    		
    		rs=pstmt.executeQuery();
    		if(rs.next()) {
    			dto = new BbsDTO();
    			dto.setBbsno(rs.getInt("bbsno"));
    			dto.setWname(rs.getString("wname"));
    			dto.setSubject(rs.getString("subject"));
    			dto.setContent(rs.getString("content"));
    			dto.setReadcnt(rs.getInt("readcnt"));
    			dto.setRegdt(rs.getString("regdt")); 
    			dto.setIp(rs.getString("ip"));
    			dto.setGrpno(rs.getInt("grpno"));
    			dto.setIndent(rs.getInt("indent"));
    			dto.setAnsnum(rs.getInt("ansnum"));
    		}

    	}catch (Exception e) {
    		System.out.println("상세보기 실패 : " + e);
    	}finally{
    		DBClose.close(con, pstmt, rs);
    	}//end
    	
    	return dto;
    }//read() end

	public void incrementCnt(int bbsno) {
    	int cnt = 0;
    	try {
    		con=dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		sql.append(" update tb_bbs ");
    		sql.append(" set readcnt = readcnt + 1 ");
    		sql.append(" where bbsno = ? ");
    		
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1, bbsno);
    		pstmt.executeUpdate();

    	}catch (Exception e) {
    		System.out.println("조회수 증가 실패 : " + e);
    	}finally{
    		DBClose.close(con, pstmt);
    	}//end
    	
		
	}//incrementCnt end
	
	public int delete(BbsDTO dto) {
		int cnt = 0;
		try {
    		con=dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		sql.append(" delete from tb_bbs  ");
    		sql.append(" where bbsno = ? and passwd =? ");


    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1, dto.getBbsno());
    		pstmt.setString(2,dto.getPasswd());
    		cnt = pstmt.executeUpdate();
    		
    		

    	}catch (Exception e) {
    		System.out.println("삭제 실패 : " + e);
    	}finally{
    		DBClose.close(con, pstmt);
    	}//end
    	
    	return cnt;
		
	}//delete end
	
	
	public int updateproc(BbsDTO dto) {
		int cnt = 0;
		try {
			con = dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" update tb_bbs ");
			sql.append(" set wname=? ");
			sql.append(" , subject=? ");
			sql.append(" , content=? ");
			sql.append(" , ip=? ");
			sql.append(" where bbsno=? and passwd=? ");
			
			pstmt = con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname());
			pstmt.setString(2,dto.getSubject());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4,dto.getIp());
			pstmt.setInt(5, dto.getBbsno());
			pstmt.setString(6,dto.getPasswd());
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e){
			System.out.println("수정 실패 :" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//updateproc() end
	
	
	
	
	public int reply(BbsDTO dto) {
		int cnt=0;
		try {
            con = dbopen.getConnection(); //오라클 데이터베이스 연결
            
            sql = new StringBuilder();
            
            //1) 부모글 정보 가져오기(select문)
            int grpno=0;	//그룹번호
            int indent=0;	//들여쓰기
            int ansnum=0;	//글순서
            
            sql.append(" SELECT grpno, indent, ansnum ");
    		sql.append(" FROM tb_bbs ");
    		sql.append(" WHERE bbsno=? ");
    		
    		pstmt = con.prepareStatement(sql.toString());
    		pstmt.setInt(1, dto.getBbsno());
    		rs = pstmt.executeQuery();
    		
    		if(rs.next()) {
    			
    			grpno = rs.getInt("grpno"); 	//그룹번호 : 부모글 그룹번호 그대로 가져오기
    			indent = rs.getInt("indent")+1; //들여쓰기 :(바로위)부모글 들여쓰기 +1
    			ansnum=rs.getInt("ansnum")+1;  //글순서 : (최상위)부모글 글순서 +1
    			
    		}//if end
             
    		
    		//2) 글순서 재조정(update문)
    		sql.delete(0, sql.length()); //1)단계에서 사용했던 sql값 지우기
    		sql.append(" UPDATE tb_bbs ");
    		sql.append(" SET ansnum=ansnum + 1 ");
    		sql.append(" WHERE grpno=? AND ansnum>=? ");
    		pstmt=con.prepareStatement(sql.toString());
    		pstmt.setInt(1, grpno);
    		pstmt.setInt(2, ansnum);
    		pstmt.executeUpdate();
            
            
            //3) 답변글 추가하기 (insert문)
    		sql.delete(0, sql.length());
    		sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno, indent, ansnum) ");
    		sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ? )");
    		
    		pstmt = con.prepareStatement(sql.toString());
    		pstmt.setString(1, dto.getWname());
    		pstmt.setString(2, dto.getSubject());
    		pstmt.setString(3, dto.getContent());
    		pstmt.setString(4, dto.getPasswd());
    		pstmt.setString(5, dto.getIp());
    		pstmt.setInt(6, grpno);
    		pstmt.setInt(7, indent);
    		pstmt.setInt(8, ansnum);

            cnt=pstmt.executeUpdate();
        }catch (Exception e) {
            System.out.println("답변쓰기 실패:" + e);
        }finally {
            DBClose.close(con, pstmt,rs);
        }//end
        return cnt;
		
	}//reply() end
	
	public int count2(String col, String word) {

		int cnt = 0;
    	try {
    		con=dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		sql.append(" SELECT COUNT(*) as cnt ");
    		sql.append(" FROM tb_bbs ");
    		
    		if(word.length()>=1) { //검색 존재한다면
    			String search = "";
    			if(col.equals("subject_content")) {
    				search+= " WHERE subject LIKE '%" + word + "%' ";
    				search+= "    OR content LIKE '%" + word + "%' ";    				
    			}else if(col.equals("subject")) {
    				search += " WHERE subject LIKE '%" + word + "%' ";
    			}else if(col.equals("content")) {
    				search += " WHERE content LIKE '%" + word + "%' "; 
    			}else if(col.equals("wname")) {
    				search += " WHERE wname LIKE '%" + word + "%' "; 
    			}//if end
    			
    			sql.append(search);
    			
    		}//if end
    		
    		pstmt = con.prepareStatement(sql.toString());
    		
    		rs=pstmt.executeQuery();
    		
    		if(rs.next()) {
    			cnt=rs.getInt("cnt");
    		}//if end
    		
    	}catch (Exception e) {
    		System.out.println("글 갯수 실패 : " + e);
    	}finally{
    		DBClose.close(con, pstmt, rs);
    	}//end
    	
    	return cnt;
		
		
	}//count2() end
	
	public ArrayList<BbsDTO> list2(String col, String word) {
    	ArrayList<BbsDTO> list = null;
    	
    	try {
    		con = dbopen.getConnection();
    		
    		sql = new StringBuilder();
    		
    		sql.append(" SELECT bbsno, wname, subject, readcnt, regdt, indent ");
    		sql.append(" FROM tb_bbs ");
    		
    		if(word.length()>=1) { //검색 존재한다면
    			String search = "";
    			if(col.equals("subject_content")) {
    				search+= " WHERE subject LIKE '%" + word + "%' ";
    				search+= "    OR content LIKE '%" + word + "%' ";    				
    			}else if(col.equals("subject")) {
    				search += " WHERE subject LIKE '%" + word + "%' ";
    			}else if(col.equals("content")) {
    				search += " WHERE content LIKE '%" + word + "%' "; 
    			}else if(col.equals("wname")) {
    				search += " WHERE wname LIKE '%" + word + "%' "; 
    			}//if end
    			
    			sql.append(search);
    			
    		}//if end
    		
    		sql.append(" ORDER BY grpno DESC, ansnum ASC ");
    		
    		pstmt = con.prepareStatement(sql.toString());
    		rs = pstmt.executeQuery();
    		if(rs.next()) {
    			list = new ArrayList<BbsDTO>();
    			do {
    				BbsDTO dto = new BbsDTO();// 한줄담기
    				dto.setBbsno(rs.getInt("bbsno"));
    				dto.setWname(rs.getString("wname"));
    				dto.setSubject(rs.getString("subject"));
    				dto.setReadcnt(rs.getInt("readcnt"));
    				dto.setRegdt(rs.getString("regdt"));
    				dto.setIndent(rs.getInt("indent"));
    				
    				list.add(dto); //list에 모으기
    			}while(rs.next());
    		}//if end
    		
    	}catch(Exception e) {
    		System.out.println("전체목록실패: " + e);
    		
    	}finally {
    		DBClose.close(con, pstmt, rs);
    	}//end
    	
    	return list;
    	
    	
    }//list2
	
	 public ArrayList<BbsDTO> list3(String col, String word, int nowPage, int recordPerPage){
	        ArrayList<BbsDTO> list = null;
	        
	        //페이지당 출력할 행의 갯수(10개를 기준)
	        //1 페이지 : WHERE r>=1  AND r<=10;
	        //2 페이지 : WHERE r>=11 AND r<=20;
	        //3 페이지 : WHERE r>=21 AND r<=30;
	        int startRow = ((nowPage-1) * recordPerPage) + 1 ;
	        int endRow   = nowPage * recordPerPage;
	        
	        try {
	           con = dbopen.getConnection();
	           
	           sql = new StringBuilder();
	           
	           word = word.trim(); //검색어 좌우 공백 제거
	           
	           if(word.length()==0) { //검색어가 존재하지 않는 경우
	                                  //bbs.sql의 페이징에서 6)번 내용으로 쿼리문 작성
	               sql.append(" SELECT * ");
	               sql.append(" FROM ( ");
	               sql.append("         SELECT bbsno,subject,wname,readcnt,indent,regdt, grpno, rownum as r ");
	               sql.append("         FROM ( ");
	               sql.append("                 SELECT bbsno, subject, wname, readcnt, indent, regdt, grpno ");
	               sql.append("                 FROM tb_bbs ");
	               sql.append("                 ORDER BY grpno DESC, ansnum ASC ");
	               sql.append("              ) ");
	               sql.append("      ) ");
	               sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	               
	           }else { //검색어가 존재하는 경우
	                   //bbs.sql의 페이징에서 7)번 내용으로 쿼리문 작성
	               sql.append(" SELECT * ");
	               sql.append(" FROM ( ");
	               sql.append("         SELECT bbsno,subject,wname,readcnt,indent,regdt, grpno, rownum as r ");
	               sql.append("         FROM ( ");
	               sql.append("                 SELECT bbsno,subject,wname,readcnt,indent,regdt, grpno ");
	               sql.append("                 FROM tb_bbs ");
	               
	               String search = "";
	               if(col.equals("subject_content")) {
	                   search += " WHERE subject LIKE '%" + word + "%' ";
	                   search += "    OR content LIKE '%" + word + "%' ";
	               }else if(col.equals("subject")) {
	                   search += " WHERE subject LIKE '%" + word + "%' ";
	               }else if(col.equals("content")) {
	                   search += " WHERE content LIKE '%" + word + "%' ";
	               }else if(col.equals("wname")) {
	                   search += " WHERE wname LIKE '%" + word + "%' ";
	               }//if end               
	               sql.append(search);
	               
	               sql.append("                 ORDER BY grpno DESC, ansnum ASC ");
	               sql.append("              ) ");
	               sql.append("      ) ");
	               sql.append(" WHERE r>=" + startRow + " AND r<=" + endRow) ;
	               
	           }//if end
	           
	           
	           pstmt=con.prepareStatement(sql.toString());
	           rs=pstmt.executeQuery();
	           if(rs.next()) {
	               list = new ArrayList<BbsDTO>();
	               do {
	                   BbsDTO dto = new BbsDTO(); //한줄담기
	                   dto.setBbsno(rs.getInt("bbsno"));
	                   dto.setWname(rs.getString("wname"));
	                   dto.setSubject(rs.getString("subject"));
	                   dto.setReadcnt(rs.getInt("readcnt"));
	                   dto.setRegdt(rs.getString("regdt"));
	                   dto.setIndent(rs.getInt("indent"));
	                   dto.setGrpno(rs.getInt("grpno"));
	                   
	                   list.add(dto); //list에 모으기
	                   
	               }while(rs.next());
	           }//if end
	           
	        }catch (Exception e) {
	            System.out.println("목록 페이징 실패::"+e);
	        }finally {
	            DBClose.close(con, pstmt, rs);
	        }//end
	        
	        return list;
	        
	    }//list3() end
	
	 public int replyCount(BbsDTO dto) {
			
			int cnt = 0;

	    	try {
	    		con=dbopen.getConnection();
	    		
	    		sql = new StringBuilder();
	    		
	    		sql.append(" SELECT GRPNO, MAX(ansnum) AS cnt ");
	    		sql.append(" FROM TB_BBS ");
	    		sql.append(" GROUP BY GRPNO ");
	    		sql.append(" HAVING GRPNO = ? ");
	    		
	    		
	    		pstmt=con.prepareStatement(sql.toString());
	    		pstmt.setInt(1, dto.getGrpno());
	    		rs=pstmt.executeQuery();
	    		
	    		
	    		if(rs.next()) {
	    			
	    			cnt = rs.getInt("cnt");
	    			
	    		}//if end
	    	
	    	}catch (Exception e) {
	    		System.out.println("댓글 갯수 실패 : " + e);
	    	}finally{
	    		DBClose.close(con, pstmt, rs);
	    	}//end
	    	
	    	return cnt;
	    }//count() end
	
	

}//class end
