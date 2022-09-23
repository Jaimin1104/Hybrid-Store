package hybridstore.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTimeFormat 
{
	public String getCurrentDate()
	{
		Date date = new Date();
		String currentDate = new SimpleDateFormat("dd-MM-yyyy").format(date);
		return currentDate;
	}
	
	public String getCurrentDateTime()
	{
		Date date = new Date();
		String currentDate = new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(date);
		return currentDate;
	}
	
	public String getDateInFormat(String date,String format) throws ParseException
	{
		Date simpleDate =  new SimpleDateFormat("dd-MM-yyyy").parse(date);
        String formattedDate = new SimpleDateFormat(format).format(simpleDate);
		return formattedDate;
	}
	
	public String getDateTimeInFormat(String date,String format) throws ParseException
	{
		Date simpleDate =  new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(date);
        String formattedDate = new SimpleDateFormat(format).format(simpleDate);
		return formattedDate;
	}
	
	public String getDateInFormat(String date,String oldFormat,String newFormat) throws ParseException
	{
		Date simpleDate =  new SimpleDateFormat(oldFormat).parse(date);
        String formattedDate = new SimpleDateFormat(newFormat).format(simpleDate);
		return formattedDate;
	}
	
	public Date getDateFromString(String dateInString) throws ParseException
	{
		Date date =  new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").parse(dateInString);
		return date;
	}
}
