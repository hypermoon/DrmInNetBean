/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package org.mypackage.hello;

//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;

/**
 *
 * @author dahua
 */
public class NameHandler {
    private String name;
    private String gender;
    public NameHandler(){
        name = null;
        gender=null;        
    }

    /**
     * @return the name
     */
    public String getName() {
  //      logger.debug("test");
        return name;
    }

    /**
     * @param name the name to set
     */
    public void setName(String name) {
        this.name = name;
    }
    
    
        /**
     * @return the name
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param name the name to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }
}
