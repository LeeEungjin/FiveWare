package com.five.ware.erp.menuRegist;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.five.ware.erp.into.IntoDTO;
import com.five.ware.file.FileDTO;

public class MenuRegistDTO extends IntoDTO{
	
	private String menuCode;
	private String menuKind;
	private String menuName;
	private String imgNull;
	private String recipe;
	private String menuOption;
	private int price;
	
	private MultipartFile [] files;
	private List<FileDTO> fileNames;
	
	public MultipartFile[] getFiles() {
		return files;
	}
	public void setFiles(MultipartFile[] files) {
		this.files = files;
	}
	public List<FileDTO> getFileNames() {
		return fileNames;
	}
	public void setFileNames(List<FileDTO> fileNames) {
		this.fileNames = fileNames;
	}
	
	public String getMenuCode() {
		return menuCode;
	}
	public void setMenuCode(String menuCode) {
		this.menuCode = menuCode;
	}
	public String getMenuKind() {
		return menuKind;
	}
	public void setMenuKind(String menuKind) {
		this.menuKind = menuKind;
	}
	public String getMenuName() {
		return menuName;
	}
	public void setMenuName(String menuName) {
		this.menuName = menuName;
	}
	public String getImgNull() {
		return imgNull;
	}
	public void setImgNull(String imgNull) {
		this.imgNull = imgNull;
	}
	public String getRecipe() {
		return recipe;
	}
	public void setRecipe(String recipe) {
		this.recipe = recipe;
	}
	public String getMenuOption() {
		return menuOption;
	}
	public void setMenuOption(String menuOption) {
		this.menuOption = menuOption;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
}
