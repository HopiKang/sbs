package com.example.sbs.api;

import com.example.sbs.Entity.Member;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;

@Slf4j
@Controller
public class HomeEntityController {
    @ResponseBody
    @GetMapping("/homentity")
    /*
    // 기본 네트워크 반환확인
    public ResponseEntity<Void> home01(){
        return new ResponseEntity<Void>(HttpStatus.OK);
    }
     */
    /*
    // String 타입으로 반환받기
    public ResponseEntity<String> home01(){
        return new ResponseEntity<String>("성공 하였습니다" ,HttpStatus.OK);
    }
     */

    //
    public ResponseEntity<Member> home01(){
        Member member = new Member();
        return new ResponseEntity<Member>(member ,HttpStatus.OK);
    }

    /*
    public ResponseEntity<ArrayList> home01(){
        ArrayList<String> arrayList = new ArrayList<>();
        return new ResponseEntity<ArrayList>("성공 하였습니다" ,HttpStatus.OK);
    }

     */
}
