package beans;

import java.io.*;
import java.util.regex.*;

public class UserBean implements Serializable
{
	private String name;
	private String age;
	//private String gender;
	private String email;
	private String contact;

	private boolean nameValid;
	private boolean ageValid;
	// private boolean genderValid;
	private boolean emailValid;
	private boolean contactValid;
	private boolean allValid;

	public UserBean() 
	{
		nameValid = false;
		ageValid = false;
		// genderValid = false;
		emailValid = false;
		contactValid = false;
		allValid = false;
	}

	public void setName(String str)
	{
		String regex = "^[a-zA-Z ]*$";
		Pattern pattern = Pattern.compile(regex);
  		Matcher matcher = pattern.matcher(str);

  		if(matcher.matches())
  		{
  			name = str;
  			nameValid = true;
  		}
  		else 
  		{
  			name = "";
  		}
	}

	public void setAge(String str)
	{
		String regex = "^[1-9]([0-9])?([0-9])?$";
		Pattern pattern = Pattern.compile(regex);
  		Matcher matcher = pattern.matcher(str);

  		if(matcher.matches())
  		{
  			age = str;
  			ageValid = true;
  		}
  		else 
  		{
  			age = "";
  		}
	}

	// public void setGender(String str)
	// {
 //  		if(str == "M" || str == "F")
 //  		{
 //  			gender = str;
 //  			//genderValid = true;
 //  		}
 //  		else 
 //  		{
 //  			gender = "";
 //  		}
	// }

	public void setEmail(String str)
	{
		String regex = "^([\\w]+[.-])*[\\w]+@+[\\w-]+\\.[a-zA-Z]{2,5}(\\.[a-zA-Z]{2,5})?$";
		Pattern pattern = Pattern.compile(regex);
  		Matcher matcher = pattern.matcher(str);

  		if(matcher.matches())
  		{
  			email = str;
  			emailValid = true;
  		}
  		else email = "";
	}

	public void setContact(String str)
	{
		String regex = "^[7-9]{1}[0-9]{6,10}$";
		Pattern pattern = Pattern.compile(regex);
  		Matcher matcher = pattern.matcher(str);

  		if(matcher.matches())
  		{
  			contact = str;
  			contactValid = true;
  		}
  		else 
  		{
  			contact = "";
  		}
	}

	public String getName()
	{
		return name;
	}

	public String getContact()
	{
		return contact;
	}

	// public String getGender()
	// {
	// 	return gender;
	// }

	public String getAge()
	{
		return age;
	}

	public String getEmail()
	{
		return email;
	}

	public boolean getNameValid()
	{
		return nameValid;
	}

	public boolean getContactValid()
	{
		return contactValid;
	}

	public boolean getAgeValid()
	{
		return ageValid;
	}

	// public boolean getGenderValid()
	// {
	// 	return genderValid;
	// }

	public boolean getEmailValid()
	{
		return emailValid;
	}

	public boolean getAllValid()
	{
		return (nameValid && ageValid && contactValid && emailValid);
	}
}