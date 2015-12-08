%% this file is for prepocessing the data

% read from excel
[num,txt,raw] = xlsread('../data/test.csv');  %file in the same folder
[m,n]=size(num);
for i=1:m

    if (strcmp(raw{i,3},'Monday'))
    raw{i,3}=1;
    end


    if (strcmp(raw{i,3},'Tuesday'))
    raw{i,3}=2;
    end

    if (strcmp(raw{i,3},'Wednesday'))
    raw{i,3}=3;
    end

    if (strcmp(raw{i,3},'Thursday'))
    raw{i,3}=4;
    end

    if (strcmp(raw{i,3},'Friday'))
    raw{i,3}=5;
    end

    if (strcmp(raw{i,3},'Saturday'))
    raw{i,3}=6;
    end

    if (strcmp(raw{i,3},'Sunday'))
    raw{i,3}=7;
    end
       
end

%For DepartmentDescription

for i=1:m

    if (strcmp(raw{i,6},'FINANCIAL SERVICES'))
    raw{i,6}=1;
    end


    if (strcmp(raw{i,6},'SHOES'))
    raw{i,6}=2;
    end

    if (strcmp(raw{i,6},'PERSONAL CARE'))
    raw{i,6}=3;
    end

    if (strcmp(raw{i,6},'PAINT AND ACCESSORIES'))
    raw{i,6}=4;
    end

    if (strcmp(raw{i,6},'DSD GROCERY'))
    raw{i,6}=5;
    end

    if (strcmp(raw{i,6},'MEAT - FRESH & FROZEN'))
    raw{i,6}=6;
    end

    if (strcmp(raw{i,6},'DAIRY'))
    raw{i,6}=7;
    end
       
    if (strcmp(raw{i,6},'PETS AND SUPPLIES'))
    raw{i,6}=8;
    end


    if (strcmp(raw{i,6},'HOUSEHOLD CHEMICALS/SUPP'))
    raw{i,6}=9;
    end

    if (strcmp(raw{i,6},'NULL'))
    raw{i,6}=10;
    end

    if (strcmp(raw{i,6},'IMPULSE MERCHANDISE'))
    raw{i,6}=11;
    end

    if (strcmp(raw{i,6},'PRODUCE'))
    raw{i,6}=12;
    end

    if (strcmp(raw{i,6},'CANDY, TOBACCO, COOKIES'))
    raw{i,6}=13;
    end

    if (strcmp(raw{i,6},'GROCERY DRY GOODS'))
    raw{i,6}=14;
    end
    if (strcmp(raw{i,6},'BOYS WEAR'))
    raw{i,6}=15;
    end


    if (strcmp(raw{i,6},'FABRICS AND CRAFTS'))
    raw{i,6}=16;
    end

    if (strcmp(raw{i,6},'JEWELRY AND SUNGLASSES'))
    raw{i,6}=17;
    end

    if (strcmp(raw{i,6},'MENS WEAR'))
    raw{i,6}=18;
    end

    if (strcmp(raw{i,6},'ACCESSORIES'))
    raw{i,6}=19;
    end

    if (strcmp(raw{i,6},'HOME MANAGEMENT'))
    raw{i,6}=20;
    end

    if (strcmp(raw{i,6},'FROZEN FOODS'))
    raw{i,6}=21;
    end
    if (strcmp(raw{i,6},'SERVICE DELI'))
    raw{i,6}=22;
    end


    if (strcmp(raw{i,6},'INFANT CONSUMABLE HARDLINES'))
    raw{i,6}=23;
    end

    if (strcmp(raw{i,6},'PRE PACKED DELI'))
    raw{i,6}=24;
    end

    if (strcmp(raw{i,6},'COOK AND DINE'))
    raw{i,6}=25;
    end

    if (strcmp(raw{i,6},'PHARMACY OTC'))
    raw{i,6}=26;
    end

    if (strcmp(raw{i,6},'LADIESWEAR'))
    raw{i,6}=27;
    end

    if (strcmp(raw{i,6},'COMM BREAD'))
    raw{i,6}=28;
    end
    if (strcmp(raw{i,6},'BAKERY'))
    raw{i,6}=29;
    end


    if (strcmp(raw{i,6},'HOUSEHOLD PAPER GOODS'))
    raw{i,6}=30;
    end

    if (strcmp(raw{i,6},'CELEBRATION'))
    raw{i,6}=31;
    end

    if (strcmp(raw{i,6},'HARDWARE'))
    raw{i,6}=32;
    end

    if (strcmp(raw{i,6},'BEAUTY'))
    raw{i,6}=33;
    end

    if (strcmp(raw{i,6},'AUTOMOTIVE'))
    raw{i,6}=34;
    end

    if (strcmp(raw{i,6},'BOOKS AND MAGAZINES'))
    raw{i,6}=35;
    end
    if (strcmp(raw{i,6},'SEAFOOD'))
    raw{i,6}=36;
    end


    if (strcmp(raw{i,6},'OFFICE SUPPLIES'))
    raw{i,6}=37;
    end

    if (strcmp(raw{i,6},'LAWN AND GARDEN'))
    raw{i,6}=38;
    end

    if (strcmp(raw{i,6},'FINANCIAL SERVICES'))
    raw{i,6}=39;
    end

    if (strcmp(raw{i,6},'SHEER HOSIERY'))
    raw{i,6}=40;
    end

    if (strcmp(raw{i,6},'WIRELESS'))
    raw{i,6}=41;
    end

    if (strcmp(raw{i,6},'BEDDING'))
    raw{i,6}=42;
    end
    if (strcmp(raw{i,6},'BATH AND SHOWER'))
    raw{i,6}=43;
    end


    if (strcmp(raw{i,6},'HORTICULTURE AND ACCESS'))
    raw{i,6}=44;
    end

    if (strcmp(raw{i,6},'HOME DECOR'))
    raw{i,6}=45;
    end

    if (strcmp(raw{i,6},'TOYS'))
    raw{i,6}=46;
    end

    if (strcmp(raw{i,6},'INFANT APPAREL'))
    raw{i,6}=47;
    end

    if (strcmp(raw{i,6},'LADIES SOCKS'))
    raw{i,6}=48;
    end

    if (strcmp(raw{i,6},'PLUS AND MATERNITY'))
    raw{i,6}=49;
    end
    if (strcmp(raw{i,6},'ELECTRONICS'))
    raw{i,6}=50;
    end


    if (strcmp(raw{i,6},'GIRLS WEAR, 4-6X  AND 7-14'))
    raw{i,6}=51;
    end

    if (strcmp(raw{i,6},'BRAS & SHAPEWEAR'))
    raw{i,6}=52;
    end

    if (strcmp(raw{i,6},'LIQUOR,WINE,BEER'))
    raw{i,6}=53;
    end

    if (strcmp(raw{i,6},'SLEEPWEAR/FOUNDATIONS'))
    raw{i,6}=54;
    end

    if (strcmp(raw{i,6},'CAMERAS AND SUPPLIES'))
    raw{i,6}=55;
    end

    if (strcmp(raw{i,6},'SPORTING GOODS'))
    raw{i,6}=56;
    end
    if (strcmp(raw{i,6},'PLAYERS AND ELECTRONICS'))
    raw{i,6}=57;
    end


    if (strcmp(raw{i,6},'PHARMACY RX'))
    raw{i,6}=58;
    end

    if (strcmp(raw{i,6},'MENSWEAR'))
    raw{i,6}=59;
    end

    if (strcmp(raw{i,6},'OPTICAL - FRAMES'))
    raw{i,6}=60;
    end

    if (strcmp(raw{i,6},'SWIMWEAR/OUTERWEAR'))
    raw{i,6}=61;
    end

    if (strcmp(raw{i,6},'OTHER DEPARTMENTS'))
    raw{i,6}=62;
    end

    if (strcmp(raw{i,6},'MEDIA AND GAMING'))
    raw{i,6}=63;
    end
    if (strcmp(raw{i,6},'FURNITURE'))
    raw{i,6}=64;
    end


    if (strcmp(raw{i,6},'OPTICAL - LENSES'))
    raw{i,6}=65;
    end

    if (strcmp(raw{i,6},'SEASONAL'))
    raw{i,6}=66;
    end

    if (strcmp(raw{i,6},'LARGE HOUSEHOLD GOODS'))
    raw{i,6}=67;
    end

    if (strcmp(raw{i,6},'1-HR PHOTO'))
    raw{i,6}=68;
    end

    if (strcmp(raw{i,6},'CONCEPT STORES'))
    raw{i,6}=69;
    end

    if (strcmp(raw{i,6},'HEALTH AND BEAUTY AIDS'))
    raw{i,6}=70;
    end
    
end

C=raw(1:m,1:7);

data=cell2mat(C);

% delete the NAN rows
%data = data(all(~isnan(data),2),:);
 save('../data/testData.mat','data');


%http://www.get-digital-help.com/2009/03/30/how-to-extract-a-unique-list-and-the-duplicates-in-excel-from-one-column/
% Above link is helpful to know "How to extract a unique distinct list from
% a column in excel"




        
    




%% TODO: feature extraction
% e.g. calculate the average and std
% or directly use the matlab TS function
