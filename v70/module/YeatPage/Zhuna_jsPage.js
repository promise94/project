/**
*=================================================================
*Name:			Ҷ��js��ҳ��ʽ��ShowoPage Style With JS��
*RCSfile:		Zhuna_jsPage.js
*Revision:		0.09
*Author:		Yehe(Ҷ��)
*Released:		2005-05-12 23:00:15
*=================================================================
*/

function Zhuna_jsPage(iRecCount,iPageSize,iPageNum,sName){
	this.iRC=this.FormatNum(iRecCount,1,0,0,0);//�ܼ�¼����
	this.iPS=this.FormatNum(iPageSize,1,0,1,0);//ÿҳ��¼��Ŀ
	this.iPN=this.FormatNum(iPageNum,0,0,0,0);//��ʾ��ǰ��ҳ��,0Ϊ��ʾ����,����Ϊ��ô��ҳ��һ����ת
	this.sN=sName;//ʵ��������
	this.sTPage="{$Page}";//ҳ��
	this.sTPageCount="{$PageCount}";//��ҳ��
	this.sTRecCount="{$RecCount}";//�ܼ�¼��
	this.sTPageSize="{$PageSize}";//ÿҳ��¼��
	this.sTPageFrist="{$PageFrist}";//��ҳ
	this.sTPagePrev="{$PagePrev}";//��ҳ
	this.sTPageNext="{$PageNext}";//��ҳ
	this.sTPageLast="{$PageLast}";//βҳ
	this.sTPageText="{$PageText}";//������ת
	this.sTPageTextF="{$PageTextF}";//������ת���
	this.sTPageInput="{$PageInput}";//�������ת
	this.sTPageSelect="{$PageSelect}";//�����˵���ת
	this.sTPageNum="{$PageNum}";//����ҳ��
	this.iPC=this.getPageCount();//�õ�ҳ��
}
//���� ҳ����ʼֵ����βֵ
Zhuna_jsPage.prototype.setPageSE=function(sPageStart,sPageEnd){
	var sPS=sPageStart,sPE=sPageEnd;
	this.sPS=(sPS.length>0)?sPS:"Page=";
	this.sPE=(sPE.length>0)?sPE:"";
}
//���� ��ַ
Zhuna_jsPage.prototype.setUrl=function(sUrl){
	var s=sUrl;
	this.Url=(s.length>0)?s:""+document.location.href;
}
//���� �����&������nameֵ
Zhuna_jsPage.prototype.setPageInput=function(sPageInput){
	var sPI=sPageInput;
	this.sPI=(sPI.length>0)?sPI:"Page";
}
//���� ���� ��ҳ(Disable,Enale)
Zhuna_jsPage.prototype.setPageFrist=function(sDis,sEn){
	this.PF_D=sDis;
	this.PF_E=sEn;
}
//���� ���� ��ҳ
Zhuna_jsPage.prototype.setPagePrev=function(sDis,sEn){
	this.PP_D=sDis;
	this.PP_E=sEn;
}
//���� ���� ��ҳ
Zhuna_jsPage.prototype.setPageNext=function(sDis,sEn){
	this.PN_D=sDis;
	this.PN_E=sEn;
}
//���� ���� βҳ
Zhuna_jsPage.prototype.setPageLast=function(sDis,sEn){
	this.PL_D=sDis;
	this.PL_E=sEn;
}
//���� ���� ������ת
Zhuna_jsPage.prototype.setPageText=function(sDis,sEn){
	this.PT_D=sDis;//"[{$PageNum}]"
	this.PT_E=sEn;//"��{$PageNum}ҳ"
}
//���� ���� ������ת��Χģ��
Zhuna_jsPage.prototype.setPageTextF=function(sDis,sEn){
	this.PTF_D=sDis;//"&nbsp;{$PageTextF}&nbsp;"
	this.PTF_E=sEn;//"&nbsp;{$PageTextF}&nbsp;"
}
//���� ���� �����˵���ת
Zhuna_jsPage.prototype.setPageSelect=function(sDis,sEn){
	this.PS_D=sDis;//"[{$PageNum}]"
	this.PS_E=sEn;//"��{$PageNum}ҳ"
}
//���� css
Zhuna_jsPage.prototype.setPageCss=function(sCssPageActionText,sCssPageText,sCssPageInput,sCssPageSelect){
	this.CPA=sCssPageActionText;//������תcss
	this.CPT=sCssPageText;//������תcss
	this.CPI=sCssPageInput;//�������תcss
	this.CPS=sCssPageSelect;//�����˵���תcss
}
//���� Htmlģ��
Zhuna_jsPage.prototype.setHtml=function(sHtml){
	this.Html=sHtml;//Htmlģ��
}
//����ҳ��
Zhuna_jsPage.prototype.getPageCount=function(){
	var iRC=this.iRC,iPS=this.iPS;
	var i=Math.ceil(iRC / iPS);//(iRC%iPS==0)?(iRC/iPS):(this.FormatNum((iRC/iPS),1,0,0,0)+1);
	return (i);
}
//ȡ��ģ��ҳ���͵�ǰҳ��
Zhuna_jsPage.prototype.getUrl=function(iType){
	var s=this.Url,sPS=this.sPS,sPE=this.sPE,sTP=this.sTPage,iPC=this.iPC;
	var iT=iType,i;
	if (s.indexOf(sPS)==-1) {	
		s+=((s.indexOf("?")==-1)?"?":"&")+sPS+sTP;
		i=1;
	}
	else {
		sReg="(\\S.*)"+this.FormatReg(sPS)+"(\\d*)"+this.FormatReg(sPE)+"(\\S.*|\\S*)";
		var sPIndex=this.Reg(s,sReg,"$3");
		s=s.replace(sPS+sPIndex+sPE,sPS+sTP+sPE);
		i=this.FormatNum(sPIndex,1,1,0,iPC);
	}
	s=this.Reg(s,"(&+)","&");
	s=this.Reg(s,"(\\?&)","?");
	return (iT==0?s:i);
}
//ҳ����ת
Zhuna_jsPage.prototype.PageJump=function(){
	var sPL,sPV,sP;
	var sU=this.getUrl(0),iPI=this.getUrl(1);
	var sPI=this.sPI,sTP=this.sTPage,iPC=this.iPC;
	sPL=document.getElementsByName(sPI).length;
	for (var i=0;i<sPL;i++)	{
		sPV=document.getElementsByName(sPI)[i].value;
		sP=this.FormatNum(sPV,1,1,0,iPC);
		if (sP>0) {
			location.href=sU.replace(sTP,sP);
			break;
		}
	}
}
//���
Zhuna_jsPage.prototype.Write=function(){
	var sU=this.getUrl(0),iPI=this.getUrl(1);
	var sN=this.sN,sPI=this.sPI;
	var iPC=this.iPC,iPN=this.iPN;;
	var iRC=this.iRC,iPS=this.iPS;
	var PF_D=this.PF_D,PF_E=this.PF_E;
	var PP_D=this.PP_D,PP_E=this.PP_E;
	var PN_D=this.PN_D,PN_E=this.PN_E;
	var PL_D=this.PL_D,PL_E=this.PL_E;
	var PT_D=this.PT_D,PT_E=this.PT_E;
	var PTF_D=this.PTF_D,PTF_E=this.PTF_E;
	var PS_D=this.PS_D,PS_E=this.PS_E;
	var CPT=this.CPT,CPI=this.CPI,CPA=this.CPA;
	var CPS=this.CPS,iPN=this.iPN;
	var s=this.Html;
	sTPage=this.sTPage;
	sTPageCount=this.sTPageCount;
	sTRecCount=this.sTRecCount;
	sTPageSize=this.sTPageSize;
	sTPFrist=this.sTPageFrist;
	sTPPrev=this.sTPagePrev;
	sTPNext=this.sTPageNext;
	sTPLast=this.sTPageLast;
	sTPText=this.sTPageText;
	sTPTextF=this.sTPageTextF;
	sTPInput=this.sTPageInput;
	sTPSelect=this.sTPageSelect;
	sTPageNum=this.sTPageNum;
	var PrevP=this.FormatNum((iPI-1),1,1,1,iPC),NextP=this.FormatNum((iPI+1),1,1,1,iPC);
	var FU,PU,NU,LU;
	//sTPFrist,FU sTPPrev,PU sTPNext,NU sTPLast,LU
	var s1="<A href=\"",s2="\">",s3="</A>";
	var s4="<strong>",s5="</strong>";
	var s6="<span>",s7="</span>";
	if (iPI<=1&&iPC<=1) {
		FU=s6+PF_D+s7;
		PU=s6+PP_D+s7;
		NU=s6+PN_D+s7;
		LU=s6+PL_D+s7;
	}
	else if (iPI==1&&iPC>1) {
		FU=s6+PF_D+s7;
		PU=s6+PP_D+s7;
		NU=s1+sU.replace(sTPage,NextP)+s2+PN_E+s3;
		LU=s1+sU.replace(sTPage,iPC)+s2+PL_E+s3;
	}
	else if (iPI==iPC) {
		FU=s1+sU.replace(sTPage,1)+s2+PF_E+s3;
		PU=s1+sU.replace(sTPage,PrevP)+s2+PP_E+s3;
		NU=s6+PN_D+s7;
		LU=s6+PL_D+s7;
	}
	else {
		FU=s1+sU.replace(sTPage,1)+s2+PF_E+s3;
		PU=s1+sU.replace(sTPage,PrevP)+s2+PP_E+s3;
		NU=s1+sU.replace(sTPage,NextP)+s2+PN_E+s3;
		LU=s1+sU.replace(sTPage,iPC)+s2+PL_E+s3;
	}

	var PageStart,PageEnd;
	if (iPN<0) {
		iPN=Math.abs(iPN);
		PageStart=(iPI%iPN==0)?(iPI/iPN):(this.FormatNum((iPI/iPN),1,0,0,0));
		PageStart=(PageStart*iPN==iPI)?((PageStart-1)*iPN+1):(PageStart*iPN+1);
		PageEnd=this.FormatNum(PageStart+iPN,0,1,0,iPC)
	}
	else if (iPN==0) {
		PageStart=1;
		PageEnd=iPC;
	}
	else {
		PageStart=this.FormatNum((iPI-iPN),1,0,1,0);
		PageEnd=this.FormatNum((PageStart+iPN*2),0,1,0,iPC);
		PageStart=(PageEnd==iPC)?this.FormatNum((PageEnd-iPN*2),1,0,1,0):PageStart;
	}
	var PSelect="",PText="",PInput="",p;
	if (iPC>=1) {
		PSelect="<Select class=\""+CPS+"\" name=\""+sPI+"\" onChange=\""+sN+".PageJump()\">";
		PInput="<Input class=\""+CPI+"\" type=\"text\" name=\""+sPI+"\" size=\"5\" maxlength=\"10\" onkeydown=\"if (event.keyCode==13) "+sN+".PageJump()\">";
		for (var i=PageStart;i<=PageEnd;i++) {
			if (i!=iPI) {
				p=s1+sU.replace(sTPage,i)+s2+PT_E.replace(sTPageNum,i)+s3;
				PText+=PTF_E.replace(sTPTextF,p);
				PSelect+="<Option value=\""+i+"\">"+PS_E.replace(sTPageNum,i)+"</Option>";
			}
			else {
				p=s4+PT_D.replace(sTPageNum,i)+s5;
				PText+=PTF_D.replace(sTPTextF,p);
				PSelect+="<Option Selected=\"Selected\">"+PS_D.replace(sTPageNum,i)+"</Option>";
			}
		}
		PSelect+="</Select>";
	}
	s=s.replace(sTPage,iPI);
	s=s.replace(sTPageCount,iPC);
	s=s.replace(sTRecCount,iRC);
	s=s.replace(sTPageSize,iPS);
	s=s.replace(sTPFrist,FU);
	s=s.replace(sTPPrev,PU);
	s=s.replace(sTPNext,NU);
	s=s.replace(sTPLast,LU);
	s=s.replace(sTPText,PText);
	s=s.replace(sTPInput,PInput);
	s=s.replace(sTPSelect,PSelect);
	document.write (s);
}
//���룺����ʽ���ַ����Ƿ�����Сֵ��0��ʾû��,1��ʾ�У����Ƿ������ֵ����Сֵ��Ĭ��ֵ�������ֵ
Zhuna_jsPage.prototype.FormatNum=function(sNum,bMin,bMax,iMinNum,iMaxNum){
	var i,iN,sN=""+sNum,iMin=iMinNum,iMax=iMaxNum;
	if (sN.length>0) {
		iN=parseInt(sN,10);
		i=(isNaN(iN))?iMin:iN;
		i=(i<iMin&&bMin==1)?iMin:i;
		i=(i>iMax&&bMax==1)?iMax:i;
	}
	else {
		i=iMin;
	}
	return (i);
}
//���룺�������ַ���������ʽ���滻���ַ�
Zhuna_jsPage.prototype.Reg=function(sStr,sReg,sRe){
	var s="",sS=sStr,sR=sReg,sRe=sRe;
	if ((sS.length>0)&&(sR.length>0)) {
		eval("re=/"+sR+"/gim;");
		s=sS.replace(re,sRe);
	}
	return (s);
}
//��ʽ�������е������ַ�
Zhuna_jsPage.prototype.FormatReg=function(sReg){
	var s="",sR=sReg;
	var sF=new Array ("/",".","+","[","]","{","}","$","^","?","*");
	if (sR.length>0) {
		for (var i=0;i<=sF.length;i++) {
			sR=sR.replace(sF[i],"\\"+sF[i]);
		}
		s="("+sR+")";
	}
	return (s);
}