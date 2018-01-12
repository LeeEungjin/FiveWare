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

import com.five.ware.erp.into.IntoDTO;
import com.five.ware.mater.MaterDTO;

public class ExcelMultiView2007 extends ExcelMyAbstractView {

	@Override
	protected Workbook createWorkbook() {
		// TODO Auto-generated method stub
		return new XSSFWorkbook();
	}

	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		Map<String, List<IntoDTO>> list = (Map<String, List<IntoDTO>>) model.get("list");
		
		Sheet sheet = workbook.createSheet("enter");
		
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
		cell.setCellValue("코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("날짜");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("부서");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("비고");
		
		// Create data cell
		for (IntoDTO intoDTO : list.get("enter")) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterCode());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterDate());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getTemp());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterMemo());
		}
		
		for (int i = 0; i < list.get("enter").size(); i++)
			sheet.autoSizeColumn(i, true);
		
		/////////////////////////////sheet2/////////////////////////////////
		Sheet sheet2 = workbook.createSheet("rele");
		
		row = null;
		cell = null;
		r = 0;
		c = 0;
		
		// Style for header cell
		CellStyle style2 = workbook.createCellStyle();
		style2.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
		style2.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style2.setAlignment(CellStyle.ALIGN_CENTER);
		
		// Create header cells
		row = sheet2.createRow(r++);
 
		cell = row.createCell(c++);
		cell.setCellStyle(style2);
		cell.setCellValue("코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style2);
		cell.setCellValue("날짜");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style2);
		cell.setCellValue("부서");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style2);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style2);
		cell.setCellValue("비고");
		
		// Create data cell
		for (IntoDTO intoDTO : list.get("rele")) {
			row = sheet2.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterCode());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterDate());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getTemp());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterMemo());
		}
		
		for (int i = 0; i < list.get("rele").size(); i++)
			sheet2.autoSizeColumn(i, true);
		
		/////////////////////////////////////////////////////////////////////////
		Sheet sheet3 = workbook.createSheet("back");
		
		row = null;
		cell = null;
		r = 0;
		c = 0;
		
		// Style for header cell
		CellStyle style3 = workbook.createCellStyle();
		style3.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
		style3.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style3.setAlignment(CellStyle.ALIGN_CENTER);
		
		// Create header cells
		row = sheet3.createRow(r++);
 
		cell = row.createCell(c++);
		cell.setCellStyle(style3);
		cell.setCellValue("코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style3);
		cell.setCellValue("날짜");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style3);
		cell.setCellValue("부서");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style3);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style3);
		cell.setCellValue("비고");
		
		// Create data cell
		for (IntoDTO intoDTO : list.get("back")) {
			row = sheet3.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterCode());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterDate());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getTemp());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterMemo());
		}
		
		for (int i = 0; i < list.get("back").size(); i++)
			sheet3.autoSizeColumn(i, true);
		
		//////////////////////////////////////////////////////////////
		Sheet sheet4 = workbook.createSheet("confin");
		
		row = null;
		cell = null;
		r = 0;
		c = 0;
		
		// Style for header cell
		CellStyle style4 = workbook.createCellStyle();
		style4.setFillForegroundColor(IndexedColors.GREY_40_PERCENT.index);
		style4.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style4.setAlignment(CellStyle.ALIGN_CENTER);
		
		// Create header cells
		row = sheet4.createRow(r++);
		
		cell = row.createCell(c++);
		cell.setCellStyle(style4);
		cell.setCellValue("코드");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style4);
		cell.setCellValue("날짜");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style4);
		cell.setCellValue("부서");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style4);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style4);
		cell.setCellValue("비고");
		
		// Create data cell
		for (IntoDTO intoDTO : list.get("confin")) {
		row = sheet4.createRow(r++);
		c = 0;
		row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterCode());
		row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterDate());
		row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getTemp());
		row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getName());
		row.createCell(c++).setCellValue(((MaterDTO)intoDTO).getMaterMemo());
		}
		
		for (int i = 0; i < list.get("confin").size(); i++)
			sheet4.autoSizeColumn(i, true);
		
	}

}
