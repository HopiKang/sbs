package com.sbs.sbsacademy.mustache;

import com.samskivert.mustache.Mustache;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

@ControllerAdvice
public class HelloAdvice {
    @ModelAttribute("hello")
    public Mustache.Lambda hello(){
        return ((frag, out) -> {
            String bodystr = frag.execute();
            out.append("Hello, " + bodystr);
        });
    }
}
