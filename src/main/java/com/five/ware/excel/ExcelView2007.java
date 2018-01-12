package com.five.ware.excel;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.javassist.expr.Instanceof;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.five.ware.erp.into.IntoDTO;
import com.five.ware.erp.menuRegist.MenuRegistDTO;
import com.five.ware.erp.product.ProductDTO;
import com.five.ware.erp.storageRegist.StorageRegistDTO;
import com.five.ware.erp.supplier.SupplierDTO;
import com.five.ware.mater.MaterDTO;
import com.five.ware.order.OrderDTO;

public class ExcelView2007 extends ExcelMyAbstractView{
	
	@Override
	protected void buildExcelDocument(Map<String, Object> model,
			Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		List<IntoDTO> list = ((List<IntoDTO>)model.get("listRooms"));
		
		// 객체 분류
		if(list != null) {
			if(list.get(0) instanceof SupplierDTO) {
				this.supplierExcelView(workbook, list);
			} else if(list.get(0) instanceof ProductDTO) {
				this.productExcelView(workbook, list);
			} else if(list.get(0) instanceof MenuRegistDTO) {
				this.menuExcelView(workbook, list);
			} else if(list.get(0) instanceof StorageRegistDTO) {
				this.storageExcelView(workbook, list);
			} else if(list.get(0) instanceof OrderDTO) {
				this.orderExcelView(workbook, list);
			} else {
				//
			}
		} else {
			System.out.println("Excel Fail");
		}
 
	}
	
	
	private void orderExcelView(Workbook workbook, List<IntoDTO> listRooms) {
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
		cell.setCellValue("주문코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("계약일");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("부서");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("작성자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("거래처");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("납부처");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("납부일");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("창고명");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("비고");
		
		
		
		// Create data cell
		for (IntoDTO intoDTO : listRooms) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getOrderCode());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getContractDate());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getTemp());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getAccount());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getDivision());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getDelivery());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getDeadline());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getStorageName());
			row.createCell(c++).setCellValue(((OrderDTO)intoDTO).getOrderMemo());
		}
		
		for (int i = 0; i < listRooms.size(); i++)
			sheet.autoSizeColumn(i, true);
	}
	
	private void storageExcelView(Workbook workbook, List<IntoDTO> listRooms) {
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
		cell.setCellValue("창고코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("창고명");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("주소");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("비고");
		
		// Create data cell
		for (IntoDTO intoDTO : listRooms) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((StorageRegistDTO)intoDTO).getStorageCode());
			row.createCell(c++).setCellValue(((StorageRegistDTO)intoDTO).getStorageName());
			row.createCell(c++).setCellValue(((StorageRegistDTO)intoDTO).getStorageAddr());
			row.createCell(c++).setCellValue(((StorageRegistDTO)intoDTO).getStorageOp());
		}
		
		for (int i = 0; i < listRooms.size(); i++)
			sheet.autoSizeColumn(i, true);
	}
	
	private void menuExcelView(Workbook workbook, List<IntoDTO> listRooms) {
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
		cell.setCellValue("메뉴코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("구분");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("메뉴명");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("가격");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("레시피");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("설명");
		
		// Create data cell
		for (IntoDTO intoDTO : listRooms) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getMenuCode());
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getMenuKind());
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getMenuName());
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getPrice());
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getRecipe());
			row.createCell(c++).setCellValue(((MenuRegistDTO)intoDTO).getMenuOption());
		}
		
		for (int i = 0; i < listRooms.size(); i++)
			sheet.autoSizeColumn(i, true);
	}
 
	private void productExcelView(Workbook workbook, List<IntoDTO> listRooms) {
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
		cell.setCellValue("품목코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("품목명");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("규격");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("개요");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("사용여부");
		
		// Create data cell
		for (IntoDTO intoDTO : listRooms) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((ProductDTO)intoDTO).getCode());
			row.createCell(c++).setCellValue(((ProductDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((ProductDTO)intoDTO).getStandard());
			row.createCell(c++).setCellValue(((ProductDTO)intoDTO).getPrice());
			row.createCell(c++).setCellValue(((ProductDTO)intoDTO).getUse());
		}
		
		for (int i = 0; i < listRooms.size(); i++)
			sheet.autoSizeColumn(i, true);
	}
	
	private void supplierExcelView(Workbook workbook, List<IntoDTO> listRooms) {
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
		cell.setCellValue("코드");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("거래처 분류");
 
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("거래처명");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("사업자 번호");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("대표자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("담당자");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("담당자 메일");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("은행");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("계좌번호");
		
		cell = row.createCell(c++);
		cell.setCellStyle(style);
		cell.setCellValue("사용여부");
		
		// Create data cell
		for (IntoDTO intoDTO : listRooms) {
			row = sheet.createRow(r++);
			c = 0;
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getCode());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getClassification());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getName());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getBusiness_number());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getRepresentative());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getDivision());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getDivision_mail());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getBank());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getAccount_number());
			row.createCell(c++).setCellValue(((SupplierDTO)intoDTO).getUse());
		}
		
		for (int i = 0; i < listRooms.size(); i++)
			sheet.autoSizeColumn(i, true);
	}
	
	
	@Override
	protected Workbook createWorkbook() {
		// TODO Auto-generated method stub
		//2007
		return new XSSFWorkbook();
	}

}
