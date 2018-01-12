package com.five.ware.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.five.ware.erp.human.dili.DiliDTO;
import com.five.ware.erp.human.dili.MemberWorkDTO;

public class ExcelDiliSearch2007 extends ExcelMyAbstractView {

	@Override
	protected Workbook createWorkbook() {
		// TODO Auto-generated method stub
		return new XSSFWorkbook();
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<MemberWorkDTO> ar = (List<MemberWorkDTO>) model.get("memberList");
		List<String> ar2= (List<String>) model.get("diliList");
		List<List<Integer>> ar3 =(List<List<Integer>>) model.get("sumList");
		

		Sheet sheet = workbook.createSheet("2007");
		Row row = null;
		Cell cell = null;
		int r = 0;
		int c = 0;
 
		// Style for header cell
		CellStyle style = workbook.createCellStyle();
		style.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setAlignment(CellStyle.ALIGN_CENTER);
 
		// Create header cells
		row = sheet.createRow(r++);
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("사번");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("성명");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("부서");
		
		for(String temp : ar2){
			cell = row.createCell(c++);
			cell.setCellStyle(style);
			cell.setCellValue(temp);
		}
 
		// Create data cell
		int cnt = 0;
		for (MemberWorkDTO memberDTO : ar) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(memberDTO.getCode());
			row.createCell(c++).setCellValue(memberDTO.getName());
			row.createCell(c++).setCellValue(memberDTO.getTemp()); 
			
			for(int j=0; j<ar3.get(cnt).size(); j++){
				row.createCell(c++).setCellValue(ar3.get(cnt).get(j)); 
			}
			cnt++;
		}
		
		for (int i = 0; i < ar.size() + ar2.size(); i++)
			sheet.autoSizeColumn(i, true);
 
	}

	

}
