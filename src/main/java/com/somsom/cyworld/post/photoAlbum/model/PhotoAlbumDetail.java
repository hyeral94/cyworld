package com.somsom.cyworld.post.photoAlbum.model;

import java.util.List;

import com.somsom.cyworld.post.photoAlbum.Review.model.PhotoAlbumReview;

public class PhotoAlbumDetail {
	
	private PhotoAlbum photoAlbum;
	private List<PhotoAlbumReview> reviewList;
	
	public PhotoAlbum getPhotoAlbum() {
		return photoAlbum;
	}
	public void setPhotoAlbum(PhotoAlbum photoAlbum) {
		this.photoAlbum = photoAlbum;
	}
	public List<PhotoAlbumReview> getReviewList() {
		return reviewList;
	}
	public void setReviewList(List<PhotoAlbumReview> reviewList) {
		this.reviewList = reviewList;
	}
	
	

}
