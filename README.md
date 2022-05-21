# 🌏 지금우리동네는(지우동) - 세미프로젝트

## Contents
1. 팀 소개
2. 프로젝트 개요
3. 설계의 주안점
4. 개발환경
5. 주요기능
6. Document

## 1️⃣ 팀 소개
<img width="1160" alt="image" src="https://user-images.githubusercontent.com/83773369/168465198-9cb4ab8e-7f36-4ef9-8ffb-abd02d727292.png">

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
<img width="962" alt="image" src="https://user-images.githubusercontent.com/83773369/168548075-bc57973e-9340-4be0-a4ab-adebbf3b6889.png">

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

<details>
<summary><h3>📌회원가입</h3></summary>
<div markdown="1">   

**사업자**

![사업자_회원가입](https://user-images.githubusercontent.com/83773369/168465463-7aeeb28d-71f3-47ee-a83e-80a969ed706a.gif)

---

**사용자**

![사용자_회원가입](https://user-images.githubusercontent.com/83773369/168465436-5684ddb1-c4a0-44a7-a66a-53aa6944c82f.gif)

</div>
</details>

---

<details>
<summary><h3>📌로그인</h3></summary>
<div markdown="1">   

**관리자**

![관리자_로그인](https://user-images.githubusercontent.com/83773369/168465466-5e0845a1-6944-4826-920f-7aab603df4bc.gif)

---

**사업자**

![사업자_로그인](https://user-images.githubusercontent.com/83773369/168465460-0ae61c30-4bbb-4e56-9b23-0f88caaab092.gif)

---

**사용자**

![사용자_로그인](https://user-images.githubusercontent.com/83773369/168465439-64a94b7c-0ccc-40ad-8a84-7e142ee6df7f.gif)

</div>
</details>

---

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
	
![14 관리자-사용자 정보 수정](https://user-images.githubusercontent.com/83773369/169652532-01654255-dc3f-4b2a-b8e7-3095c328de3f.gif)


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
	
![16 관리자-리뷰 조회](https://user-images.githubusercontent.com/83773369/169652548-8a6cd2c7-a620-40c0-b137-1368c4597b11.gif)

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


</div>
</details>

---

## 4. 사업자

**마이페이지**

![사업자_마이페이지_통계](https://user-images.githubusercontent.com/83773369/168464136-1211afec-5d8a-4e15-a01d-787b81bcaa9a.gif)

---

<details>
<summary><h3>📌내 정보 관리 자세히 보기</h3></summary>
<div markdown="1">   

**내 정보 조회**


![사업자_내정보 조회2](https://user-images.githubusercontent.com/83773369/168465638-651a68fd-cc4e-4c15-a962-1845ee9e85e1.gif)
	
- 사업자 로그인 후 우측 토글버튼 클릭 - 비밀번호 재설정으로도 진입 가능
![image](https://user-images.githubusercontent.com/83773369/168464235-aa02bebc-91f4-4bbd-b372-9549ac660dd5.png)


---

**내 정보 수정**

![사업자_내정보 수정](https://user-images.githubusercontent.com/83773369/168464289-669fc5aa-c5bc-4d68-b439-d8cff4eabdb1.gif)


---

**내 정보 삭제**

![사업자_내정보 삭제](https://user-images.githubusercontent.com/83773369/168464291-83aa9d71-ee90-4c01-a3f1-eeab23fe68a4.gif)


</div>
</details>

---

<details>
<summary><h3>📌리뷰 관리 자세히 보기</h3></summary>
<div markdown="1">   

**리뷰 조회**

![사업자_리뷰관리](https://user-images.githubusercontent.com/83773369/168464601-cbfa9c39-7930-4598-8706-d8d81a082ff6.gif)

</div>
</details>

---

<details>
<summary><h3>📌 업체 등록 자세히 보기</h3></summary>
<div markdown="1">  


**업체 등록**

![사업자_업체등록](https://user-images.githubusercontent.com/83773369/168464341-10904fa7-27c0-48fa-961c-297739e6d319.gif)


---

**업체 재등록**

![사업자_업체재등록](https://user-images.githubusercontent.com/83773369/168464365-74db4064-e015-4f46-af42-01cb57552805.gif)


</div>
</details>

---

<details>
<summary><h3>📌예약 관리 자세히 보기</h3></summary>
<div markdown="1">   

**예약 메뉴 등록**

![사업자_예약메뉴등록](https://user-images.githubusercontent.com/83773369/168464387-b42275b6-3fae-48a7-a881-35dd2233e619.gif)


---

**예약 메뉴 삭제**

![사업자_예약메뉴삭제](https://user-images.githubusercontent.com/83773369/168464415-edcba1ee-9eb8-4957-9627-6f0a1d435cdc.gif)

---

**예약 조회**

![사업자_ 예약조회](https://user-images.githubusercontent.com/83773369/168464456-4489c602-c57a-4952-a491-81cf6caf5f83.gif)


---

**예약 수정**

![사업자_예약수정](https://user-images.githubusercontent.com/83773369/168464474-399129ad-ce85-4e62-8609-fee51e7ae721.gif)


---

**예약 추가(미용실)**

![사업자_예약추가_미용실](https://user-images.githubusercontent.com/83773369/168464498-d7c0e2ac-264d-4c3e-afc1-d52641b76590.gif)


---

**예약 추가(카페)**

![사업자_예약추가_카페](https://user-images.githubusercontent.com/83773369/168464501-955c5892-2be1-4c06-8798-e42fe7eef5db.gif)

---

**예약 추가(호텔)**

![사업자_예약추가_호텔](https://user-images.githubusercontent.com/83773369/168464502-8d37bbff-1218-4aa0-812f-ebee699e6ccf.gif)

---

**예약 취소**

![사업자_예약취소](https://user-images.githubusercontent.com/83773369/168464550-6700e4b3-b277-42f1-aca1-a58944d92bdf.gif)



</div>
</details>

---



## 5) 사용자

**마이페이지**

![사용자_마이페이지](https://user-images.githubusercontent.com/83773369/168464688-abc7c3cf-2ce7-4627-a1dd-cbcb26a09f95.gif)

---

<details>
<summary><h3>📌업체 조회 자세히 보기</h3></summary>
<div markdown="1">   

**업체 조회**

![사용자_업체조회](https://user-images.githubusercontent.com/83773369/168464784-8ed24af3-97b9-4a65-bc0d-5d47c5fbfa5f.gif)


---

**업체 상세 조회**

![사용자_업체상세페이지](https://user-images.githubusercontent.com/83773369/168464786-49f59c6c-0aa0-467a-8b8f-fcbd3a781ae6.gif)


---

**예약 추가(미용실)**

![사용자_예약추가_미용실](https://user-images.githubusercontent.com/83773369/168464856-bffc17d1-2ba2-4848-9d7d-bb6b99d8c852.gif)


---

**예약 추가(카페)**

![사용자_예약추가_카페](https://user-images.githubusercontent.com/83773369/168464858-2c04a390-7f3e-4c71-9266-4b9f43e1f247.gif)


---

**예약 추가(호텔)**

![사용자_예약추가_호텔](https://user-images.githubusercontent.com/83773369/168464859-1935d3c2-2901-473e-85c3-554e32c7c93e.gif)

</div>
</details>

---


<details>
<summary><h3>📌주변 검색 자세히 보기</h3></summary>
<div markdown="1">   

![사용자_주변검색](https://user-images.githubusercontent.com/83773369/168464949-32f71c73-7302-4f61-b11b-5a60127fe5aa.gif)

</div>
</details>

---

<details>
<summary><h3>📌리뷰 자세히 보기</h3></summary>
<div markdown="1">   

**리뷰 조회**

![사용자_리뷰조회](https://user-images.githubusercontent.com/83773369/168465265-9fba5e2f-6659-4331-9973-d444d435488a.gif)

---

**리뷰 작성**

![사용자_리뷰작성](https://user-images.githubusercontent.com/83773369/168464972-9d5d49ed-4dad-47b5-9ada-526bac5e5cc2.gif)

---

**리뷰 수정**

![사용자_리뷰수정](https://user-images.githubusercontent.com/83773369/168464974-04364074-5138-4778-8bba-2c4e4c03d096.gif)

---

**리뷰 삭제** 

![사용자_리뷰삭제](https://user-images.githubusercontent.com/83773369/168464976-864adf41-e58e-4c13-bf85-c1a661f1fac1.gif)

</div>
</details>

---

<details>
<summary><h3>📌내 정보 관리 자세히 보기</h3></summary>
<div markdown="1">   

**내 정보 수정**

![사용자_내정보관리](https://user-images.githubusercontent.com/83773369/168465024-e3ac6ea3-d086-47fe-9291-8478cdff4231.gif)

---

**회원 탈퇴**

![사용자_회원탈퇴](https://user-images.githubusercontent.com/83773369/168465018-6e5311d7-e405-4b5c-a49f-3630e2cd7a00.gif)



</div>
</details>

---
## 6) Q&A
<img width="1122" alt="image" src="https://user-images.githubusercontent.com/83773369/168458303-69314d35-be0c-4318-938b-6488751c8a62.png">


## 7) 에러페이지
<img width="829" alt="image" src="https://user-images.githubusercontent.com/83773369/168447876-3d3c0244-925f-4827-bb36-cce3f12efdbd.png">


## 6️⃣ Document
##  1. 개발 일정
<img width="1126" alt="image" src="https://user-images.githubusercontent.com/83773369/168447412-28736a3f-a0e8-47c8-904e-34343aefc4b7.png">

## 2. 유스케이스
<img width="1201" alt="image" src="https://user-images.githubusercontent.com/83773369/168447064-4bdc751a-f7b6-4325-8d8e-e4a628f02d7d.png">

<img width="1201" alt="image" src="https://user-images.githubusercontent.com/83773369/168447075-4e3ad35a-c0eb-4c90-9320-931ca7fde707.png">

<img width="1199" alt="image" src="https://user-images.githubusercontent.com/83773369/168447078-143f15f3-15ca-4497-9fe3-50c5780365bb.png">

## 3. ERD

<img width="1001" alt="image" src="https://user-images.githubusercontent.com/83773369/169019667-3918c4fa-27ad-4ce8-b871-f3e7b02b8128.png">

[테이블 기술서 전체보기](https://drive.google.com/drive/u/1/folders/1eM3NsuFrjW4dcDZALMLHLnXWtFjFahah)

## 4. 요구사항 정의서
[요구사항 정의서 전체보기](https://drive.google.com/drive/u/1/folders/11UWxrTCOo_3BtBdWLLmnAtcoD0JS5bzm)

## 5. 화면설계서
[화면설계서 전체 보기](https://drive.google.com/drive/u/1/folders/1oXHcvlAFx-wfronghJ1xExvmH9Dtbb7m)

## 6. 시퀀스 다이어그램
[시퀀스 다이어그램 전체 보기](https://drive.google.com/drive/u/1/folders/1JcGGySiAHIRwYiEuvuGW8hHk5w21RaOL)

## 7. 클래스 다이어그램

**메인 컨트롤러, JDBC**
![메인컨트롤러, JDBC](https://user-images.githubusercontent.com/83773369/168447178-c732b5f2-1f48-4ef0-b851-65554c8e3905.png)

**관리자**
![관리자MVC1](https://user-images.githubusercontent.com/83773369/168447180-1021cf0c-06ba-466c-bdb3-c4338f0cf69d.png)
![관리자MVC2](https://user-images.githubusercontent.com/83773369/168447181-f5cd6248-3d0c-4892-8749-eb6810590faf.png)

**사업자**
![사업자MVC1](https://user-images.githubusercontent.com/83773369/168463946-cabb2970-e680-4ff3-a9b3-85596a02b23f.png)
![사업자MVC2](https://user-images.githubusercontent.com/83773369/168463949-bf8c5da9-8d14-4b86-8e8b-6e0977497593.png)
![사업자MVC3](https://user-images.githubusercontent.com/83773369/168463951-736a8f4d-49f2-4081-b841-05496b2e9afa.png)

**사용자**
![사용자MVC1](https://user-images.githubusercontent.com/83773369/168463954-c3dc0ea1-5058-4d35-aa96-a34141838bc6.png)
![사용자MVC2](https://user-images.githubusercontent.com/83773369/168463955-ccf00a10-53aa-44fd-9e54-56bc4c73076f.png)
![사용자MVC3](https://user-images.githubusercontent.com/83773369/168465094-baf66234-cb18-45ca-b513-aa665be11765.png)
