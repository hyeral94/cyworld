package com.somsom.cyworld.post.photoAlbum.model;

import java.util.List;

import com.somsom.cyworld.post.photoAlbum.photoAlbumReview.model.PhotoAlbumReview;

public class PhotoAlbumDetail {

	private PhotoAlbum photoAlbum;
	private List<PhotoAlbumReview> photoAlbumReviewList;
	
	public PhotoAlbum getPhotoAlbum() {
		return photoAlbum;
	}
	public void setPhotoAlbum(PhotoAlbum photoAlbum) {
		this.photoAlbum = photoAlbum;
	}
	public List<PhotoAlbumReview> getPhotoAlbumReviewList() {
		return photoAlbumReviewList;
	}
	public void setPhotoAlbumReviewList(List<PhotoAlbumReview> photoAlbumReviewList) {
		this.photoAlbumReviewList = photoAlbumReviewList;
	}
	

}
