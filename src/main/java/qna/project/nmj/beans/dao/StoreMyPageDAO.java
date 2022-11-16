package qna.project.nmj.beans.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import qna.project.nmj.beans.*;

public interface StoreMyPageDAO {

	/**
	 * select review by store_uid
	 * @return ReviewJoinDTO
	 */
	public ArrayList<ReviewJoinDTO> reviewSelect(int store_uid);
	

	/**
	 * select *
	 * @return SpaceListDTO 
	 */
	public ArrayList<SpaceListDTO> spaceListSelect();

	/**
	 * insert space_type to spaceList 
	 * @return int
	 */
	public int spaceListInsert(String space_type);

	/**
	 * select a store by store_uid
	 * @return StoreDTO
	 */
	public int spaceInsert(SpaceDTO dto);
	
	/**
	 * select a space by store_uid
	 * @return SpaceDTO
	 */
	public ArrayList<SpaceDTO> spaceSelect(int store_uid);
	
	public ArrayList<StoreMyReviewDTO> reservSelect(int store_uid);
	
	public int spaceEmpty(int space_uid, int space_empty);
	
	public ArrayList<StoreSpaceImgDTO> spaceImgSelect(int store_uid);
	
	public ArrayList<SpaceImgDTO> spaceSelectByUid(int space_uid);
	
	public int spaceImageInsert(int space_uid, String space_img_org, String space_img_sav);
	
	public int spaceImageDelete(int space_img_uid);
	
	/**
	 * select a store by store_uid
	 * @return StoreDTO
	 */
	public StoreDTO selectStoreByUid(int store_uid);
	
	/**
	 * update a store by store_uid w/o image
	 * @param dto
	 * @return success == 1
	 */
	public int updateStoreWOImageByUid(@Param("dto") StoreDTO dto);
	
	/**
	 * update a store by store_uid w/ image
	 * @param dto
	 * @return success == 1
	 */
	public int updateStoreWImageByUid(@Param("dto") StoreDTO dto);
	
	/**
	 * select all store_dtype
	 * @return StoreTypeDTO[]
	 */
	public ArrayList<StoreTypeDTO> selectAllStoreDType();
	
	/**
	 * insert a request to change store settings
	 * @param dto
	 * @return success == 1
	 */
	public int insertRequest(@Param("dto") RequestDTO dto);
	
	/**
	 * select all food from one store
	 * @param store_uid
	 * @return
	 */
	public ArrayList<FoodDTO> selectFoodByStoreUid(int store_uid);
	
	/**
	 * select food by food_uid
	 * @param food_uid
	 * @return
	 */
	public FoodDTO selectFoodByFoodUid(int food_uid);
	
	/**
	 * update food by food_uid
	 * @param dto
	 * @return
	 */
	public int updateFoodByFoodUid(@Param("dto") FoodDTO dto);
	
	/**
	 * delete food by food _uid
	 * @param food_uid
	 * @return
	 */
	public int deleteFoodByFoodUid(int food_uid);

	/**
	 * insert food by store_uid
	 * @param dto
	 * @return
	 */
	public int insertFoodByStoreUid(@Param("dto") FoodDTO dto);

	
	public ArrayList<StoreDTO> selectAllStores();
	
	public int reservationOk(int reservation_uid);
	
	public int reservationNo(int reservation_uid);
	
	public int spaceDelete(int space_uid);
}
