// SPDX-License-Identifier: GPL-3.0
//rafe taahode arzi
pragma solidity >=0.7.0 <0.9.0;

contract Bank {
    uint256 public Cash_price;
    uint256 public Havale_price;
    uint256 public Varedat_Khod_Price;
    uint256 public Varedat_Digari_Price;
    // halata rafe taahod
    enum Rafe_taahod {
        Cash,
        Havale,
        Varedat_Khod,
        Varedat_Digari
    }
    struct Rf {
        uint256 Code_melli_bazargan;
        Rafe_taahod Halat;
        uint256 Shomarea_rafetaahod;
        uint256 Tarikhe_rafetaahod;
        uint256 Mablgh;
        bool Done_Bank;
        bool Done_Daraii;
        bool Done_Gomrok;
        bool Done_Samt;
        bool Done_final;
    }
    mapping(address =>Rf) public My_data;
    Rafe_taahod public rafe_taahod ;
    function get() public view returns (Rafe_taahod) {
        return rafe_taahod;
    }
    function set(Rafe_taahod _h) public {
        rafe_taahod= _h;
    }
        Rf [] public All_data;
        
    function get(address _addr1) public view returns  (Rf memory alll) {
        return My_data[_addr1];
    }

    function set(
        address _addr1,
        uint256  _Name, 
        Rafe_taahod  _rf, 
        uint  _shomare,
        uint  _terikh, 
        uint  _mablagh
    ) public {
        My_data[_addr1].Code_melli_bazargan=_Name;
        My_data[_addr1].Halat=_rf;
        My_data[_addr1].Shomarea_rafetaahod=_shomare;
        My_data[_addr1].Tarikhe_rafetaahod=_terikh;
        My_data[_addr1].Mablgh=_mablagh;
        My_data[_addr1].Done_Bank=false;
            }
    //update mablagh
    function Update_Data(
        address _addr1, 
        Rafe_taahod  _rf, 
        uint  _shomare,
        uint  _terikh, 
        uint  _mablagh
            ) public {
        if(My_data[_addr1].Shomarea_rafetaahod==_shomare && My_data[_addr1].Tarikhe_rafetaahod==_terikh && My_data[_addr1].Halat==_rf ) 
        {
        My_data[_addr1].Mablgh=_mablagh;
        }
        }

    //Update Halat
        function Update_Halat(
        address _addr1, 
        Rafe_taahod  _rf, 
        uint  _shomare,
        uint  _terikh, 
        uint  _mablagh
    ) public {
        if(My_data[_addr1].Shomarea_rafetaahod==_shomare && My_data[_addr1].Tarikhe_rafetaahod==_terikh && My_data[_addr1].Mablgh==_mablagh ) 
        {
        My_data[_addr1].Halat=_rf;
        }
        }


    function remove(address _addr1) public view {
        My_data[_addr1].Done_Bank == true;
    }
    
    function get2() public view returns (uint256) {
        return Cash_price;
    }
    function set2(
        uint256 _p
    ) public {
        Cash_price= _p;
    }

    function get3() public view returns (uint256) {
        return Havale_price;
    }
    function set3(
        uint256 _p
    ) public {
        Havale_price= _p;
    }
    function get4() public view returns (uint256) {
        return Varedat_Khod_Price;
    }
    function set4(
        uint256 _p
    ) public {
        Varedat_Khod_Price= _p;
    }

    function get5() public view returns (uint256) {
        return Varedat_Digari_Price;
    }
    function set5(
        uint256 _p
    ) public {
        Varedat_Digari_Price= _p;
    }


    function Pay_cash_doller(address _add2 , uint _shomare ,uint _terikh, uint _mablagh ) public {
       Cash_price=_mablagh;
        if(Cash_price==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Cash  ){
            My_data[_add2].Done_Bank=true;
        }
            else{
            My_data[_add2].Done_Bank=false;
            } 
    }
    function Pay_Havale_doller(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh ) public {
        Havale_price=_mablagh;
        if(Havale_price==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Havale ){
            My_data[_add2].Done_Bank=true;
        }
            else{
            My_data[_add2].Done_Bank=false;
            } 
    }

    function Import_export(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Khod_Price=_mablagh;
        if(Varedat_Khod_Price==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Khod ){
            My_data[_add2].Done_Bank=true;
        }
            else{
            My_data[_add2].Done_Bank=false;
            } 
    }
    function Import_export_other(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Digari_Price=_mablagh;
        if(Varedat_Digari_Price==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Digari ){
            My_data[_add2].Done_Bank=true;
        }
            else{
            My_data[_add2].Done_Bank=false;
            } 
    }
}
/////
/////
/////
contract Daraii is Bank {
    uint256 public Cash_price_dara;
    uint256 public Havale_price_dara;
    uint256 public Varedat_Khod_Price_dara;
    uint256 public Varedat_Digari_Price_dara;
    ///
    function get2_dara() public view returns (uint256) {
        return Cash_price_dara;
    }
    function set2_dara(
        uint256 _p
    ) public {
        Cash_price_dara= _p;
    }

    function get3_dara() public view returns (uint256) {
        return Havale_price_dara;
    }
    function set3_dara(
        uint256 _p
    ) public {
        Havale_price_dara= _p;
    }
    function get4_dara() public view returns (uint256) {
        return Varedat_Khod_Price_dara;
    }
    function set4_dara(
        uint256 _p
    ) public {
        Varedat_Khod_Price_dara= _p;
    }

    function get5_dara() public view returns (uint256) {
        return Varedat_Digari_Price_dara;
    }
    function set5_dara(
        uint256 _p
    ) public {
        Varedat_Digari_Price_dara= _p;
    }
    ///
    ///
    ///
        function Pay_cash_doller_dara(address _add2 , uint _shomare ,uint _terikh, uint _mablagh  ) public {
       Cash_price_dara=_mablagh;
        if(Cash_price_dara==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Cash ){
            My_data[_add2].Done_Daraii=true;
        }
            else{
            My_data[_add2].Done_Daraii=false;
            } 
    }
    function Pay_Havale_doller_dara(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh ) public {
        Havale_price_dara=_mablagh;
        if(Havale_price_dara==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Havale ){
            My_data[_add2].Done_Daraii=true;
        }
            else{
            My_data[_add2].Done_Daraii=false;
            } 
    }

    function Import_export_dara(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Khod_Price_dara=_mablagh;
        if(Varedat_Khod_Price_dara==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Khod ){
            My_data[_add2].Done_Daraii=true;
        }
            else{
            My_data[_add2].Done_Daraii=false;
            } 
    }
    function Import_export_other_dara(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Digari_Price_dara=_mablagh;
        if(Varedat_Digari_Price_dara==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Digari ){
            My_data[_add2].Done_Daraii=true;
        }
            else{
            My_data[_add2].Done_Daraii=false;
            } 
    }

}
///
///
///
contract Gomrok is Bank{
    uint256 public Cash_price_gomrok;
    uint256 public Havale_price_gomrok;
    uint256 public Varedat_Khod_Price_gomrok;
    uint256 public Varedat_Digari_Price_gomrok;
    ///
    function get2_gomrok() public view returns (uint256) {
        return Cash_price_gomrok;
    }
    function set2_gomrok(
        uint256 _p
    ) public {
        Cash_price_gomrok= _p;
    }

    function get3_gomrok() public view returns (uint256) {
        return Havale_price_gomrok;
    }
    function set3_gomrok(
        uint256 _p
    ) public {
        Havale_price_gomrok= _p;
    }
    function get4_gomrok() public view returns (uint256) {
        return Varedat_Khod_Price_gomrok;
    }
    function set4_gomrok(
        uint256 _p
    ) public {
        Varedat_Khod_Price_gomrok= _p;
    }

    function get5_gomrok() public view returns (uint256) {
        return Varedat_Digari_Price_gomrok;
    }
    function set5_gomrok(
        uint256 _p
    ) public {
        Varedat_Digari_Price_gomrok= _p;
    }
    ///
    ///
    ///
        function Pay_cash_doller_gomrok(address _add2 , uint _shomare ,uint _terikh, uint _mablagh  ) public {
       Cash_price_gomrok=_mablagh;
        if(Cash_price_gomrok==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Cash ){
            My_data[_add2].Done_Gomrok=true;
        }
            else{
            My_data[_add2].Done_Gomrok=false;
            } 
    }
    function Pay_Havale_doller_gomrok(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh ) public {
        Havale_price_gomrok=_mablagh;
        if(Havale_price_gomrok==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Havale ){
            My_data[_add2].Done_Gomrok=true;
        }
            else{
            My_data[_add2].Done_Gomrok=false;
            } 
    }

    function Import_export_gomrok(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Khod_Price_gomrok=_mablagh;
        if(Varedat_Khod_Price_gomrok==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Khod ){
            My_data[_add2].Done_Gomrok=true;
        }
            else{
            My_data[_add2].Done_Gomrok=false;
            } 
    }
    function Import_export_other_gomrok(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Digari_Price_gomrok=_mablagh;
        if(Varedat_Digari_Price_gomrok==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Digari ){
            My_data[_add2].Done_Gomrok=true;
        }
            else{
            My_data[_add2].Done_Gomrok=false;
            } 
    }

}
///
///
///
contract Samt is Bank{
    uint256 public Cash_price_samt;
    uint256 public Havale_price_samt;
    uint256 public Varedat_Khod_Price_samt;
    uint256 public Varedat_Digari_Price_samt;
    ///
    function get2_samt() public view returns (uint256) {
        return Cash_price_samt;
    }
    function set2_samt(
        uint256 _p
    ) public {
        Cash_price_samt= _p;
    }

    function get3_samt() public view returns (uint256) {
        return Havale_price_samt;
    }
    function set3_samt(
        uint256 _p
    ) public {
        Havale_price_samt= _p;
    }
    function get4_samt() public view returns (uint256) {
        return Varedat_Khod_Price_samt;
    }
    function set4_samt(
        uint256 _p
    ) public {
        Varedat_Khod_Price_samt= _p;
    }

    function get5_samt() public view returns (uint256) {
        return Varedat_Digari_Price_samt;
    }
    function set5_samt(
        uint256 _p
    ) public {
        Varedat_Digari_Price_samt= _p;
    }
    ///
    ///
    ///
    function Pay_cash_doller_samt(address _add2 , uint _shomare ,uint _terikh, uint _mablagh  ) public {
       Cash_price_samt=_mablagh;
        if(Cash_price_samt==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Cash ){
            My_data[_add2].Done_Samt=true;
        }
            else{
            My_data[_add2].Done_Samt=false;
            } 
    }
    function Pay_Havale_doller_samt(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh ) public {
        Havale_price_samt=_mablagh;
        if(Havale_price_samt==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Havale ){
            My_data[_add2].Done_Samt=true;
        }
            else{
            My_data[_add2].Done_Samt=false;
            } 
    }

    function Import_export_samt(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Khod_Price_samt=_mablagh;
        if(Varedat_Khod_Price_samt==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Khod ){
            My_data[_add2].Done_Samt=true;
        }
            else{
            My_data[_add2].Done_Samt=false;
            } 
    }
    function Import_export_other_samt(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Digari_Price_samt=_mablagh;
        if(Varedat_Digari_Price_samt==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Digari ){
            My_data[_add2].Done_Samt=true;
        }
            else{
            My_data[_add2].Done_Samt=false;
            } 
    }


}
///
///
///
contract Final is Bank{
    uint256 public Cash_price_final;
    uint256 public Havale_price_final;
    uint256 public Varedat_Khod_Price_final;
    uint256 public Varedat_Digari_Price_final;
    ///
    function get2_final() public view returns (uint256) {
        return Cash_price_final;
    }
    function set2_final(
        uint256 _p
    ) public {
        Cash_price_final= _p;
    }

    function get3_final() public view returns (uint256) {
        return Havale_price_final;
    }
    function set3_final(
        uint256 _p
    ) public {
        Havale_price_final= _p;
    }
    function get4_final() public view returns (uint256) {
        return Varedat_Khod_Price_final;
    }
    function set4_final(
        uint256 _p
    ) public {
        Varedat_Khod_Price_final= _p;
    }

    function get5_final() public view returns (uint256) {
        return Varedat_Digari_Price_final;
    }
    function set5_final(
        uint256 _p
    ) public {
        Varedat_Digari_Price_final= _p;
    }
    ///
    ///
    ///

    function Pay_cash_doller_final(address _add2 , uint _shomare ,uint _terikh, uint _mablagh  ) public {
       Cash_price_final=_mablagh;
        if(Cash_price_final==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Cash && My_data[_add2].Done_Bank==true && My_data[_add2].Done_Daraii==true && My_data[_add2].Done_Samt==true && My_data[_add2].Done_Gomrok==true ){
            My_data[_add2].Mablgh=0;
            My_data[_add2].Done_final=true;
        }
            else{
            My_data[_add2].Done_final=false;
            } 
    }
    function Pay_Havale_doller_final(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh ) public {
        Havale_price_final=_mablagh;
        if(Havale_price_final==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Havale && My_data[_add2].Done_Bank==true && My_data[_add2].Done_Daraii==true && My_data[_add2].Done_Samt==true && My_data[_add2].Done_Gomrok==true){
            My_data[_add2].Mablgh=0;
            My_data[_add2].Done_final=true;
        }
            else{
            My_data[_add2].Done_final=false;
            } 
    }

    function Import_export_final(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Khod_Price_final=_mablagh;
        if(Varedat_Khod_Price_final==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Khod && My_data[_add2].Done_Bank==true && My_data[_add2].Done_Daraii==true && My_data[_add2].Done_Samt==true && My_data[_add2].Done_Gomrok==true ){
            My_data[_add2].Mablgh=0;
            My_data[_add2].Done_final=true;
        }
            else{
            My_data[_add2].Done_final=false;
            } 
    }
    function Import_export_other_final(address _add2 , uint _shomare ,uint _terikh ,uint _mablagh) public {
        Varedat_Digari_Price_final=_mablagh;
        if(Varedat_Digari_Price_final==My_data[_add2].Mablgh && My_data[_add2].Shomarea_rafetaahod == _shomare && My_data[_add2].Tarikhe_rafetaahod==_terikh && My_data[_add2].Halat==Rafe_taahod.Varedat_Digari && My_data[_add2].Done_Bank==true && My_data[_add2].Done_Daraii==true && My_data[_add2].Done_Samt==true && My_data[_add2].Done_Gomrok==true){
            My_data[_add2].Mablgh=0;
            My_data[_add2].Done_final=true;
        }
            else{
            My_data[_add2].Done_final=false;
            } 
    }   

    }
