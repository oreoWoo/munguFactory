<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>

<script type="text/javascript">
function daumPostSearch(){
    new daum.Postcode({
        oncomplete: function(data) {
            $("#factory_address1").val("("+data.zonecode+") "+data.address);
            document.getElementById("factory_address2").focus();
        }
    }).open();
}
function addressSet(main){
	if(main==""){
		alert("주소검색을 먼저 실행 해 주세요.");
		$('#factory_address2').val("");
	}
}

function changUse(obj) {
    alert(obj.value); // 선택된 option의 value가 출력된다!
    $("#factory_use").val(obj.value);
	}
	
</script>
</head>
<body>
		<form action="/insertFactory">
		 <table>

            <div class="container-xxl flex-grow-1 container-p-y">
              <h4 class="fw-bold py-3 mb-4"><span class="text-muted fw-light">Factory /</span> Create Factory</h4>
                <!-- Basic with Icons -->
                <div class="col-xxl">
                  <div class="card mb-4">
                    <div class="card-header d-flex align-items-center justify-content-between">
                      <h5 class="mb-0">Create Factory</h5>
                      <small class="text-muted float-end"></small>
                    </div>
                    <div class="card-body">
                      <form>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-fullname">Factory No</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                            생성 시 자동으로 부여 됩니다.
<!--                               <input
                                type="text"
                                class="form-control"
                                id="factory_no"
                                name="factory_no"
                                placeholder="생성 시 자동으로 부여 됩니다."
                                aria-label="factoryNo"
                                aria-describedby="basic-icon-default-fullname2"
                                readonly="readonly"
                              /> -->
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">Factory Name</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                                ><i class="bx bx-buildings"></i
                              ></span>
                              <input
                                type="text"
                                id="factory_name"
                                name="factory_name"
                                class="form-control"
                                placeholder="FactoryName"
                                aria-label="FactoryName"
                                aria-describedby="basic-icon-default-company2"
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">Factory Address</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                                ><i class="bx bx-buildings"></i
                              ></span>
                              <input
                                type="text"
                                id="factory_address1"
                                name="factory_address1"
                                class="form-control"
                                placeholder="FactoryAddress"
                                aria-label="FactoryAddress"
                                aria-describedby="basic-icon-default-company2"
                                readonly="readonly" onclick="daumPostSearch()"
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 col-form-label" for="basic-icon-default-company">Detailed Address</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-company2" class="input-group-text"
                                ><i class="bx bx-buildings"></i
                              ></span>
                              <input
                                type="text"
                                id="factory_address2"
                                name="factory_address2"
                                class="form-control"
                                placeholder="DetailedAddress"
                                aria-label="DetailedAddress"
                                aria-describedby="basic-icon-default-company2"
                                onkeyup="addressSet()"
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 form-label" for="basic-icon-default-phone">Factory Call</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-phone2" class="input-group-text"
                                ><i class="bx bx-phone"></i
                              ></span>
                              <input
                                type="text"
                                id="factory_call"
                                name="factory_call"
                                class="form-control phone-mask"
                                placeholder="012-345-6789"
                                aria-label="012-345-6789"
                                aria-describedby="basic-icon-default-phone2"
                              />
                            </div>
                          </div>
                        </div>
                        <div class="row mb-3">
                          <label class="col-sm-2 form-label" for="basic-icon-default-message">Factory Use</label>
                          <div class="col-sm-10">
                            <div class="input-group input-group-merge">
                              <span id="basic-icon-default-message2" class="input-group-text"
                                ><i class="bx bx-comment"></i
                              ></span>
                              <select onchange="javascript:changUse(this);" id="factory_use" name="factory_use">
                              	<option value="">-사용여부-</option>
                              	<option value="1">사용</option>
                              	<option value="0">미사용</option>    	
                              </select>
                            </div>
                          </div>
                        </div>
                        <div class="row justify-content-end">
                          <div class="col-sm-10">
                            <button type="submit" class="btn btn-primary">Send</button>
                          </div>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
         </table>
		</form>
            <!-- / Content -->
</body>
</html>