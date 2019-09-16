package com.NtoS.myapp.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.plaf.synth.SynthSeparatorUI;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

//import com.NtoS.myapp.model.Feed;
//import com.NtoS.myapp.model.FeedMessage;
//import com.NtoS.myapp.parser.RSSFeedParser;

@Controller

public class RSSCotroller {

   @RequestMapping(value="rss", method=RequestMethod.GET)
   public String newList(HttpSession session, Model model) throws MalformedURLException, IOException {
      //국민일보 사회기사 (x : 글자깨짐)
      //String requestURL = "http://rss.kmib.co.kr/data/kmibSocRss.xml";
      //경향신문 정치기사(x: 404)
      //String requestURL = "http://www.khan.co.kr/rss/rssdata/politic_news.xml";
      //한계레 주요기사 (x : 글자깨짐)
      //String requestURL = "http://www.hani.co.kr/rss/lead/";
      //매일경제 헤드라인(x : 글자깨짐)
      //String requestURL = "http://file.mk.co.kr/news/rss/rss_30000001.xml";
      
      //피드 가져올 URL 저장
      String[] requestURL = {"http://rss.donga.com/total.xml",//동아일보 전체기사 ok
                  "http://rss.joins.com/joins_homenews_list.xml",//중앙일보 주요기사 ok
                  "http://myhome.chosun.com/rss/www_section_rss.xml",//조선일보 주요기사 ok
                  "http://rss.hankyung.com/new/news_main.xml",//한국경제 주요뉴스 ok
                  "http://rss.etnews.com/Section904.xml"//전자신문 추천기사 ok
                  };
      
      //타이틀 - 링크 저장할 맵
      HashMap<String , String> mapDongA = new HashMap<String , String>();
      HashMap<String , String> mapJoongAng = new HashMap<String , String>();
      HashMap<String , String> mapChosun = new HashMap<String , String>();
      HashMap<String , String> mapHanKyung = new HashMap<String , String>();
      HashMap<String , String> mapEtnews = new HashMap<String , String>();
      
      //파싱
      for(int i=0; i<5; i++) {   
         Document document = Jsoup.parse(new URL(requestURL[i]).openStream(), "UTF8", requestURL[i]);
         Elements elements = document.select("item");
         String[] docStrArr = elements.toString().split("\n");
         
         ArrayList<String> title = new ArrayList<>();
         ArrayList<String> link = new ArrayList<>();
         for(String str : docStrArr) {
            if(str.contains("title")) {
               String refactor = str.replace("<title>", "").replace("</title>", "").replace("&lt;![CDATA[", "").replaceAll("]&gt;", "").trim();
               title.add(refactor.substring(0, refactor.length()-1));
               //System.out.println("타이틀 입력 : " + title );
               
            }else if(str.contains("link")) {
               link.add(str.replace("<link>", "").replaceAll(" ", ""));
               //System.out.println("링크 입력 : " + link);
            }
         }
         
         //맵에 저장
         if(title.size() == link.size()) {
            for(int j=0; j < link.size(); j++ ) {
               switch(i) {
               case 0:
                  mapDongA.put(title.get(j), link.get(j));
                  break;
               case 1:
                  mapJoongAng.put(title.get(j), link.get(j));
                  break;
               case 2:
                  mapChosun.put(title.get(j), link.get(j));
                  break;
               case 3:
                  mapHanKyung.put(title.get(j), link.get(j));
                  break;
               case 4:
                  mapEtnews.put(title.get(j), link.get(j));
                  break;
               default:
                  System.out.println("해당하는 게 없다");   
               }
            }
         }else {
            System.out.println("사이즈 일치 안함!!!! : " + i);
         }
      }

      //테스트 출력
      /*
      System.out.println("전자신문");
        for(HashMap.Entry<String, String> elem : mapEtnews.entrySet()){
            String key = elem.getKey();
            String value = elem.getValue();
            System.out.println(key+" : " + value);
        }*/
      model.addAttribute("mapDongA", mapDongA);
      model.addAttribute("mapJoongAng", mapJoongAng);
      model.addAttribute("mapChosun", mapChosun);
      model.addAttribute("mapHanKyung", mapHanKyung);
      model.addAttribute("mapEtnews", mapEtnews);
      
      //return "news/news_list";
      return "news/news_status";
   }
   
   @RequestMapping(value="/news_write", method=RequestMethod.GET)
   public String newsWrite(HttpSession session, @RequestParam String link, @RequestParam String title, Model model) throws IOException { 
      //본문 크롤링
      System.out.println("기사 하나짜리 링크");
      System.out.println(link);
      System.out.println(title);
      
      Document doc = Jsoup.connect(link).get();    
      
      ArrayList<String> newsData = new ArrayList<>();
      newsData.add(title);
      newsData.add(link);
      
      
      //동아일보 
      if(link.contains("donga")) {
         Element arc = doc.removeClass(".article_relation");
         Elements article = arc.select(".article_txt");
         String content = article.toString();
         
         newsData.add(content);   
      }
      //조선일보
      else if(link.contains("chosun")) {
         Elements article = doc.select("#news_body_id");//일반
         String content = article.toString();
         newsData.add(content);
         
         if(content.equals("")) {
            Elements article1 = doc.select(".article");   //biz
            String content1 = article1.toString();
            newsData.add(content1);
         }
            
         System.out.println(content);   
      }
      
      //한국경제
      else if(link.contains("hankyung")) {
         Elements article = doc.select("#newsView");//일반
         String content = article.toString();
         newsData.add(content);
      }
      //전자신문
      else if(link.contains("etnews")) {
         Elements article = doc.select("#articleBody");//일반
         String content = article.toString();
         newsData.add(content);
      }
      //중앙일보
      else if(link.contains("news.joins.com")) {
         //중앙일보는 에러!!!!!(주소 인코딩 문제)
      }
      model.addAttribute("newsData", newsData);
         
      return "news/news_write";
   }
   
   //사설 입력 처리
   @RequestMapping(value="/write_article", method=RequestMethod.POST)
   public String writeArticle() {
      
      
      return "redirect:/";//??
   }
   //write_article
}