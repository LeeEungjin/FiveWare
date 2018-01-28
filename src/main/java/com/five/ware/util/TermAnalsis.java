package com.five.ware.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.five.ware.project.ProjectDTO;

// projectList���� ������� ����ϱ� ���� ��� ��ȯ
public class TermAnalsis {
	
	private String[] prjs_termsBig;
	private int cnt;
	private long days;
	private int sumCnt;
	
	public TermAnalsis(ProjectDTO prjDto, String[] prjs_termsBig) {
		this.prjs_termsBig = prjs_termsBig;
		try {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate = formatter.parse(prjDto.getPrj_start());
			Date lastDate = formatter.parse(prjDto.getPrj_last());
			days = ((lastDate.getTime() - startDate.getTime()) / (1000 * 60 * 60 * 24)) + 1;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		cnt = (int) (prjs_termsBig.length / days);
	}
	
	public String[] getTermsFormat() {
		String[] prjs_terms = new String[cnt];
		for(int i=0; i<cnt; i++) {
			prjs_terms[i] = termFormat();
		}
		return  prjs_terms;
	}
	private String termFormat() {
		StringBuffer sb = new StringBuffer();
		for(int i=0; i<days; i++,sumCnt++) {
			sb.append(prjs_termsBig[sumCnt]);
		}
		return sb.toString();
	}
}
