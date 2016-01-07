function seconds = extractTime(imageString)
    info = imfinfo(imageString);
    hours = str2num(info.FileModDate(13:14));
    min = hours * 60 + str2num(info.FileModDate(16:17));
    seconds = min * 60 + str2num(info.FileModDate(19:20));
    
    