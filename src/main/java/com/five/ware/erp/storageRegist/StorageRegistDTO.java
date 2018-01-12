package com.five.ware.erp.storageRegist;

import com.five.ware.erp.into.IntoDTO;

public class StorageRegistDTO extends IntoDTO {
	
	private String storageCode;
	private String storageName;
	private String storageOp;
	private String storageAddr;
	private String imgNull;
	
	public String getStorageCode() {
		return storageCode;
	}
	public void setStorageCode(String storageCode) {
		this.storageCode = storageCode;
	}
	public String getStorageName() {
		return storageName;
	}
	public void setStorageName(String storageName) {
		this.storageName = storageName;
	}
	public String getStorageOp() {
		return storageOp;
	}
	public void setStorageOp(String storageOp) {
		this.storageOp = storageOp;
	}
	public String getStorageAddr() {
		return storageAddr;
	}
	public void setStorageAddr(String storageAddr) {
		this.storageAddr = storageAddr;
	}
	public String getImgNull() {
		return imgNull;
	}
	public void setImgNull(String imgNull) {
		this.imgNull = imgNull;
	}
	
	

}
