package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.ajax.dto.AjaxStoreDTO;

public interface MapDAO {
	public ArrayList<AjaxStoreDTO> selectStoresWithDistance(@Param("lat") double lat, @Param("lon")double lon);
}
