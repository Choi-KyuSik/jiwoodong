# 🌏 지금우리동네는(지우동) - 세미프로젝트

## Contents
1. 팀 소개
2. 프로젝트 개요
3. 설계의 주안점
4. 개발환경
5. 주요기능
6. Document

## 1️⃣ 팀 소개
<img width="1162" alt="image" src="https://user-images.githubusercontent.com/83773369/168447317-defa1f4b-faef-4347-81e5-ab7c73c96445.png">

## 2️⃣ 프로젝트 개요

**우리 동네의 핫플레이스를 한 눈에 확인하고 예약하는 시스템**
- 비대면 시대에 맞춰 온라인으로 사업자와 사용자가 쉽게 소통
- 시간과 장소에 구애받지 않고 클릭 한 번으로 편하게 예약 가능
- 실시간으로 예약 현황을 확인하여 고객의 에약 스케쥴 관리

## 3️⃣ 설계의 주안점
- **접근성**
	- 업체 추천을 통해 내 주변에 있는 사업자와 사용자의 접근성을 높임
- **편의성**
	- 사용자가 한 페이지에서 조회, 예약을 동시에 가능하도록 편의성을 높임
- **오류의 최소화**
	- 많은 테스트를 통해 여러가지 오류들을 수정해 사용자의 불편함을 최소화함

## 4️⃣ 개발환경
<img width="961" alt="image" src="https://user-images.githubusercontent.com/83773369/168447270-dd617924-a856-447a-8054-22d641082a44.png">

## 5️⃣ 주요기능
## 1. 메인페이지
<img src="https://user-images.githubusercontent.com/83773369/168444106-cea219e8-40e9-4399-aed7-a5e9c8ce9c0e.gif">

 - About
 - Service
 - 공지사항
 - 업체리스트
 - 고객 이용 후기
 - 장소와 업체 검색(kakao Map API 사용)
 
## 2. 회원 가입 / 로그인

## 3. 관리자

**마이페이지**

![2  관리자-마이페이지](https://user-images.githubusercontent.com/83773369/168458741-5436a11f-af3e-4496-a729-e7cc36f718db.gif)

- 업체 등록 요청 현황
- 업체별 예약 현황 (highcharts API 사용)
- 공지사항


---


<details>
<summary><h3>📌공지사항 관리 자세히 보기</h3></summary>
<div markdown="1">   
	

**공지사항 조회**
	
	
![3 관리자-공지사항 조회](https://user-images.githubusercontent.com/83773369/168458882-b2e13f69-1163-4335-ace9-3a80c75c6c6b.gif)


- 한 페이지에 15개씩 글이 조회되도록 페이징 처리
- 제목, 내용으로 검색 가능
- 검색된 내용이 없으면 '검색결과가 없습니다.' 안내 메세지 표시
- '목록으로' 누르면 공지사항 리스트로 이동

<img width="1094" alt="image" src="https://user-images.githubusercontent.com/83773369/168458921-1cb74ea1-47fc-4e6d-b3af-9ccb00b83e78.png">

---

	
**공지사항 작성**
	
	
	
![4 관리자-공지사항 작성](https://user-images.githubusercontent.com/83773369/168459019-189e250e-9b56-485f-ba2f-574289ddbabf.gif)


- 제목, 내용 입력 필수 - 띄어쓰기만 입력 또는 입력안했을 때 경고창 띄우고 focus사용
<img width="539" alt="image" src="https://user-images.githubusercontent.com/83773369/168459148-18c3f4bd-1a00-4f8d-8ab5-dbe0c2edad40.png">


---
	

**공지사항 수정**
	
	
	
![5 관리자-공지사항 수정](https://user-images.githubusercontent.com/83773369/168459084-46c7f0bc-deca-4a8c-81be-bd94b6f31910.gif)

- 파일 수정하지 않을 경우 기존파일 유지
- 파일 수정 시 새로 등록한 파일로 수정
- uploadcare API 사용

---
	

**공지사항 삭제**
	
	
	
![6 관리자-공지사항 삭제](https://user-images.githubusercontent.com/83773369/168459231-9f858927-b1e2-44cf-bbc9-d1812da20055.gif)

</div>
</details>


---


<details>
<summary><h3>📌사업자 관리 자세히 보기</h3></summary>
<div markdown="1">   

**업체 신청 조회**

![7 관리자-업체 신청 조회](https://user-images.githubusercontent.com/83773369/168459600-547b238e-19d7-4781-becb-4d83c1f01fb3.gif)

- 한 페이지에 15개씩 글이 조회되도록 페이징 처리
- 업종, 업체명으로 검색 가능
- 검색된 내용이 없으면 '검색결과가 없습니다.' 안내 메세지 표시
- '목록으로' 누르면 업체 신청 내역 리스트로 이동

---

**업체 승인**


![8 관리자-업체 승인](https://user-images.githubusercontent.com/83773369/168459755-27dedcd7-8bb5-455d-a452-3e1ed6703a07.gif)


- 입력한 양식에 맞으면 업체 승인
- 승인된 업체 리스트 수락 리스트에서 확인


---

**업체 승인 거절**

![9 관리자-업체 거절](https://user-images.githubusercontent.com/83773369/168459855-9f62283f-4274-45ac-8ca7-079cc661a31d.gif)

- 거절 시 거절 사유를 입력하고 사업자가 거절 사유를 확인
- 거절된 업체 리스트 거절 리스트에서 확인

---

**사업자 정보 조회**

![10 관리자-사업자 정보 조회](https://user-images.githubusercontent.com/83773369/168460025-51ad3913-1277-4397-8846-18abec52b50b.gif)

- 한 페이지에 10명씩 조회되도록 페이징 처리
- 아이디, 이름으로 검색 가능
- 검색된 내용이 없으면 '검색결과가 없습니다.' 안내 메세지 표시
- '목록으로' 누르면 사업자 회원 정보 조회 리스트로 이동

---

**사업자 정보 수정**


![11 관리자-사업자 정보 수정](https://user-images.githubusercontent.com/83773369/168460148-3cb24668-477e-46e9-ab85-53e6204019d3.gif)

- 전화번호, 이메일만 수정 가능
- 값 입력 시 유효성 검사(keyup 이벤트)

---

**사업자 회원 탈퇴**

![12 관리자-사업자 회원 탈퇴](https://user-images.githubusercontent.com/83773369/168460226-582cd7ff-ee5e-4e83-9222-6b6a6e189cfa.gif)


</div>
</details>



---


<details>
<summary><h3>📌사용자 관리 자세히 보기</h3></summary>
<div markdown="1">   

**사용자 정보 조회**

![13 관리자-사용자 정보 조회](https://user-images.githubusercontent.com/83773369/168460410-9c06b7a7-4b52-4ec4-b974-8df492d17ae5.gif)

- 한 페이지에 10명씩 조회되도록 페이징 처리
- 아이디, 이름으로 검색 가능
- 검색된 내용이 없으면 '검색결과가 없습니다.' 안내 메세지 표시
- '목록으로' 누르면 사업자 회원 정보 조회 리스트로 이동

---

**사용자 정보 수정**

![14 관리자-사용자 정보 수정](https://user-images.githubusercontent.com/83773369/168460618-39514399-ef49-4284-a542-319543a1ffc4.gif)


- 전화번호, 이메일, 주소 수정 가능
- 값 입력 시 유효성 검사
- kakao 주소 API 사용
![image](https://user-images.githubusercontent.com/83773369/168460654-64efa65d-b06a-45bf-b3c6-c642de413ab9.png)


---

**사용자 회원 탈퇴**

![15 관리자-사용자 회원 탈퇴](https://user-images.githubusercontent.com/83773369/168460731-38953131-b05c-45ff-963c-8fb6635ac823.gif)

</div>
</details>


---


<details>
<summary><h3>📌리뷰 관리 자세히 보기</h3></summary>
<div markdown="1">   

**리뷰 조회**

![16 관리자-리뷰 조회](https://user-images.githubusercontent.com/83773369/168460874-cb4876ff-a952-4336-9889-a81e3cdd39c4.gif)

- 업체 별 리뷰 별점 통계(highcharts API 사용)
- 한 페이지에 10개씩 조회되도록 페이징 처리
- 업종, 업체명, 리뷰작성자, 내용으로 검색 가능
- 검색된 내용이 없으면 '검색결과가 없습니다.' 안내 메세지 표시
- '목록으로' 누르면 사업자 리뷰 조회 리스트로 이동

---

**리뷰 수정**

![17 관리자-리뷰 수정](https://user-images.githubusercontent.com/83773369/168460979-9436da04-8138-4b2b-929e-5480743cf4f5.gif)

- 수정 시 별점 선택, 내용 입력, 파일 선택(uploadcare API 사용) 


---

**리뷰 삭제**

![18 관리자-리뷰 삭제](https://user-images.githubusercontent.com/83773369/168461214-6e6910c8-c4b0-4d5f-af43-aae8d8e71bae.gif)
	
---


</div>
</details>

## 4. 사업자

## 5. 사용자

## 6. 에러페이지
<img width="829" alt="image" src="https://user-images.githubusercontent.com/83773369/168447876-3d3c0244-925f-4827-bb36-cce3f12efdbd.png">


## 6️⃣ Document
##  1. 개발 일정
<img width="1126" alt="image" src="https://user-images.githubusercontent.com/83773369/168447412-28736a3f-a0e8-47c8-904e-34343aefc4b7.png">

## 2. 유스케이스
<img width="1201" alt="image" src="https://user-images.githubusercontent.com/83773369/168447064-4bdc751a-f7b6-4325-8d8e-e4a628f02d7d.png">

<img width="1201" alt="image" src="https://user-images.githubusercontent.com/83773369/168447075-4e3ad35a-c0eb-4c90-9320-931ca7fde707.png">

<img width="1199" alt="image" src="https://user-images.githubusercontent.com/83773369/168447078-143f15f3-15ca-4497-9fe3-50c5780365bb.png">

## 3. ERD

![image](https://user-images.githubusercontent.com/83773369/168447017-92f146b1-2229-4192-9149-50be3d7bbae5.png)

## 4. 요구사항 정의서
[요구사항 정의서 전체보기](https://github.com/dms873/jiwoodong/files/8693820/1._.xlsx)

## 5. 화면설계서
[화면설계서 - 관리자](https://github.com/dms873/jiwoodong/files/8693821/_.pdf)
[화면설계서 - 사업자](https://github.com/dms873/jiwoodong/files/8693822/_.pdf)
[화면설계서 - 사용자](https://github.com/dms873/jiwoodong/files/8693823/_.pdf)

## 6. 시퀀스 다이어그램

[시퀀스 다이어그램 전체 보기](https://github.com/dms873/jiwoodong/files/8693843/default.pdf)

## 7. 클래스 다이어그램

**메인 컨트롤러, JDBC**
![메인컨트롤러, JDBC](https://user-images.githubusercontent.com/83773369/168447178-c732b5f2-1f48-4ef0-b851-65554c8e3905.png)

**관리자**
![관리자MVC1](https://user-images.githubusercontent.com/83773369/168447180-1021cf0c-06ba-466c-bdb3-c4338f0cf69d.png)
![관리자MVC2](https://user-images.githubusercontent.com/83773369/168447181-f5cd6248-3d0c-4892-8749-eb6810590faf.png)
