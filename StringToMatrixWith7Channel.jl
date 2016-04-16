
#this julia script constructs 19*19*3 GoBoard State for given one game sequence,
#first channel=the place of the stones of the first player
#second channel=the place of the stones of the second player
#third channel=the place of the stones of the simple ko rule
#fourth channel= i th state of the game according to first and second player's stone places


input=readline(STDIN);
inputLength=length(input);


numberOfMoveBinary=round(Int64,(inputLength-1)/12);

global GoBoardInput=round(Int64,zeros(19,19,3,numberOfMoveBinary-1));
global GoBoardOutput=round(Int64,zeros(19,19,1,numberOfMoveBinary-1));

for numberOfTurnDuringGame=1:numberOfMoveBinary-1
    indexNumbersOfWhite=round(Int64,zeros(1,numberOfTurnDuringGame*2));
    CounterOfWhiteStonesIndex=1;
    indexNumbersOfBlack=round(Int64,zeros(1,numberOfTurnDuringGame*2));
    CounterOfBlackStonesIndex=1;
    temporaryInput=input[1:numberOfTurnDuringGame*12];
    for i=1:length(temporaryInput)-3
        if temporaryInput[i]=='W'
            indexNumbersOfWhite[CounterOfWhiteStonesIndex]=temporaryInput[i+2]-'a'+1;
            CounterOfWhiteStonesIndex=CounterOfWhiteStonesIndex+1;
            indexNumbersOfWhite[CounterOfWhiteStonesIndex]=temporaryInput[i+3]-'a'+1;
            CounterOfWhiteStonesIndex=CounterOfWhiteStonesIndex+1;
        elseif input[i]=='B'
            indexNumbersOfBlack[CounterOfBlackStonesIndex]=temporaryInput[i+2]-'a'+1;
            CounterOfBlackStonesIndex=CounterOfBlackStonesIndex+1;
            indexNumbersOfBlack[CounterOfBlackStonesIndex]=temporaryInput[i+3]-'a'+1;
            CounterOfBlackStonesIndex=CounterOfBlackStonesIndex+1;
        end
    end

    for i=1:(round(Int64,length(indexNumbersOfWhite)/2))
        GoBoardInput[indexNumbersOfWhite[2*i-1],indexNumbersOfWhite[2*i],1,numberOfTurnDuringGame]=1;
    end

    for j=1:(round(Int64,length(indexNumbersOfBlack)/2))
        GoBoardInput[indexNumbersOfBlack[2*j-1],indexNumbersOfBlack[2*j],2,numberOfTurnDuringGame]=1;
    end
    for i=1:(round(Int64,length(indexNumbersOfWhite)/2))
        GoBoardInput[indexNumbersOfWhite[2*i-1],indexNumbersOfWhite[2*i],3,numberOfTurnDuringGame]=1;
        GoBoardInput[indexNumbersOfBlack[2*i-1],indexNumbersOfBlack[2*i],3,numberOfTurnDuringGame]=1;
    end
end
    indexNumbersOfWhiteForOutput=round(Int64,zeros(1,numberOfMoveBinary*2));
    CounterOfWhiteStonesIndexForOutput=1;
for numberOfTurnForOutput=1:numberOfMoveBinary-1
    temporaryOutput=input[numberOfTurnForOutput*12+1:numberOfTurnForOutput*12+6];
    for i=1:length(temporaryOutput)-3
        if temporaryOutput[i]=='W'
            indexNumbersOfWhiteForOutput[CounterOfWhiteStonesIndexForOutput]=temporaryOutput[i+2]-'a'+1;
            CounterOfWhiteStonesIndexForOutput=CounterOfWhiteStonesIndexForOutput+1;
            indexNumbersOfWhiteForOutput[CounterOfWhiteStonesIndexForOutput]=temporaryOutput[i+3]-'a'+1;
            CounterOfWhiteStonesIndexForOutput=CounterOfWhiteStonesIndexForOutput+1;
        end
    end
    indexNumbersOfWhiteForOutput
end

for i=1:(round(Int64,length(indexNumbersOfWhiteForOutput)/2))-1
         GoBoardOutput[indexNumbersOfWhiteForOutput[2*i-1],indexNumbersOfWhiteForOutput[2*i],1,i]=1;
end

function LibertySolver(Coordinate1, CoordinateOfGeneral1)
  CoordinateOfGeneral=CoordinateOfGeneral1;
  Coordinate=Coordinate1;

  length=size(Coordinate,2);
  TheLocationsWillBeCheckedForCase1=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase2=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase3=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase4=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase5=round(Int64,zeros(1,8));
  TheLocationsWillBeCheckedForCase6=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase7=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase8=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase9=round(Int64,zeros(1,4));
  LibertyValueOfStone=round(Int64,zeros(1,round(Int64,size(Coordinate,2)/2)));

  HalfLengthOfCoordinate=size(CoordinateOfGeneral,2)/2;
  for i=1:div(length,2)
    if (Coordinate[2*i-1] == 1 & (1 < Coordinate[2*i] & Coordinate[2*i] < 19))
        print("case 1\n")

        TheLocationsWillBeCheckedForCase1[1:2:3]=1;
        TheLocationsWillBeCheckedForCase1[2]=Coordinate[2*i]-1;
        TheLocationsWillBeCheckedForCase1[4]=Coordinate[2*i]+1;
        TheLocationsWillBeCheckedForCase1[5]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase1[6]=Coordinate[2*i];
        print(TheLocationsWillBeCheckedForCase1)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase1,2),2)
                if ((TheLocationsWillBeCheckedForCase1[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase1[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i] == 19) & (1 < Coordinate[2*i-1] & Coordinate[2*i-1] < 19))
        print("case 2\n")
        TheLocationsWillBeCheckedForCase2[1]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase2[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase2[3]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase2[4]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase2[5]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase2[6]=Coordinate[2*i]-1;
        print(TheLocationsWillBeCheckedForCase2)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase2,2),2)
                if ((TheLocationsWillBeCheckedForCase2[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase2[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i-1] == 19) & (1 < Coordinate[2*i] & Coordinate[2*i] < 19))
        print("case 3\n")
        TheLocationsWillBeCheckedForCase3[1]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase3[2]=Coordinate[2*i]-1;
        TheLocationsWillBeCheckedForCase3[3]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase3[4]=Coordinate[2*i]+1;
        TheLocationsWillBeCheckedForCase3[5]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase3[6]=Coordinate[2*i];
        print(TheLocationsWillBeCheckedForCase3)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase3,2),2)
                if ((TheLocationsWillBeCheckedForCase3[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase3[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i] == 1) & (1 < Coordinate[2*i-1] & Coordinate[2*i-1] < 19))
        print("case 4\n")
        TheLocationsWillBeCheckedForCase4[1]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase4[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase4[3]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase4[4]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase4[5]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase4[6]=Coordinate[2*i]+1;
        print(TheLocationsWillBeCheckedForCase4)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase4,2),2)
                if ((TheLocationsWillBeCheckedForCase4[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase4[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((1 < Coordinate[2*i-1] & Coordinate[2*i-1] < 19) & (1 < Coordinate[2*i] & Coordinate[2*i] < 19))
        print("case 5\n")
        TheLocationsWillBeCheckedForCase5[1]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase5[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase5[3]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase5[4]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase5[5]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase5[6]=Coordinate[2*i]-1;
        TheLocationsWillBeCheckedForCase5[7]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase5[8]=Coordinate[2*i]+1;
        print(TheLocationsWillBeCheckedForCase5)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase5,2),2)
                if ((TheLocationsWillBeCheckedForCase5[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase5[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i-1] == 1) & (Coordinate[2*i] == 1))
        print("case 6\n")
        TheLocationsWillBeCheckedForCase6[1]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase6[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase6[3]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase6[4]=Coordinate[2*i]+1;
        print(TheLocationsWillBeCheckedForCase6)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase6,2),2)
                if ((TheLocationsWillBeCheckedForCase6[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase6[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i-1] == 1) & (Coordinate[2*i] == 19))
        print("case 7\n")
        TheLocationsWillBeCheckedForCase7[1]=Coordinate[2*i-1]+1;
        TheLocationsWillBeCheckedForCase7[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase7[3]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase7[4]=Coordinate[2*i]-1;
        print(TheLocationsWillBeCheckedForCase7)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase7,2),2)
                if ((TheLocationsWillBeCheckedForCase7[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase7[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i-1] == 19) & (Coordinate[2*i] == 1))
        print("case 8\n")
        TheLocationsWillBeCheckedForCase8[1]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase8[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase8[3]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase8[4]=Coordinate[2*i]+1;
        print(TheLocationsWillBeCheckedForCase8)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase8,2),2)
                if ((TheLocationsWillBeCheckedForCase8[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase8[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    elseif ((Coordinate[2*i-1] == 19) & (Coordinate[2*i] == 19))
        print("case 9\n")
        TheLocationsWillBeCheckedForCase9[1]=Coordinate[2*i-1]-1;
        TheLocationsWillBeCheckedForCase9[2]=Coordinate[2*i];
        TheLocationsWillBeCheckedForCase9[3]=Coordinate[2*i-1];
        TheLocationsWillBeCheckedForCase9[4]=Coordinate[2*i]-1;
        print(TheLocationsWillBeCheckedForCase9)
        print("\n")
        count=0;
        for k=1:round(Int64,HalfLengthOfCoordinate)
            for j=1:div(size(TheLocationsWillBeCheckedForCase9,2),2)
                if ((TheLocationsWillBeCheckedForCase9[2*j-1]==CoordinateOfGeneral[2*k-1])&(TheLocationsWillBeCheckedForCase9[2*j]==CoordinateOfGeneral[2*k]))
                    count=count+1
                end
            end
        end
        print(count)
        print("\n")
        LibertyValueOfStone[1,i]=4-count;

    end
  end
  return LibertyValueOfStone
end
GoBoardWithSevenChannel=round(Int64,zeros(19,19,8,numberOfMoveBinary-1));
for ithStateOfBoard=1:numberOfMoveBinary-1

  indexMatrixOfWhite=findn(GoBoardInput[:,:,1,ithStateOfBoard]);
  indexMatrixOfBlack=findn(GoBoardInput[:,:,2,ithStateOfBoard]);
  indexMatrixOfGeneral=findn(GoBoardInput[:,:,3,ithStateOfBoard]);

  locationMatrixOfWhite= zeros(1,2*size(indexMatrixOfWhite[1],1));
  locationMatrixOfBlack= zeros(1,2*size(indexMatrixOfBlack[1],1));
  locationMatrixOfGeneral=zeros(1,2*size(indexMatrixOfGeneral[1],1));

  for i=1:size(indexMatrixOfWhite[1],1)
            locationMatrixOfWhite[1,2*i-1]=indexMatrixOfWhite[1][i];
            locationMatrixOfWhite[1,2*i]  =indexMatrixOfWhite[2][i];
  end
  locationMatrixOfWhite=round(Int64,locationMatrixOfWhite);
  for i=1:size(indexMatrixOfBlack[1],1)
            locationMatrixOfBlack[1,2*i-1]=indexMatrixOfBlack[1][i];
            locationMatrixOfBlack[1,2*i]  =indexMatrixOfBlack[2][i];
  end
  locationMatrixOfBlack=round(Int64,locationMatrixOfBlack);
  for i=1:size(indexMatrixOfGeneral[1],1)
            locationMatrixOfGeneral[2*i-1]=indexMatrixOfGeneral[1][i];
            locationMatrixOfGeneral[2*i]  =indexMatrixOfGeneral[2][i];
  end
  locationMatrixOfGeneral=round(Int64,locationMatrixOfGeneral);
  LibertyValueOfWhiteStone=LibertySolver(locationMatrixOfWhite,locationMatrixOfGeneral);
  LibertyValueOfBlackStone=LibertySolver(locationMatrixOfBlack,locationMatrixOfGeneral);
  for i=1:div(size(locationMatrixOfWhite,2),2)
      if(LibertyValueOfWhiteStone[1,i]==0)
          GoBoardWithSevenChannel[locationMatrixOfWhite[2*i-1],locationMatrixOfWhite[2*i],:,ithStateOfBoard]=0;
      elseif(LibertyValueOfWhiteStone[1,i]==1)
          GoBoardWithSevenChannel[locationMatrixOfWhite[2*i-1],locationMatrixOfWhite[2*i],1,ithStateOfBoard]=1;
      elseif(LibertyValueOfWhiteStone[1,i]==2)
          GoBoardWithSevenChannel[locationMatrixOfWhite[2*i-1],locationMatrixOfWhite[2*i],2,ithStateOfBoard]=1;
      elseif(LibertyValueOfWhiteStone[1,i]>=3)
          GoBoardWithSevenChannel[locationMatrixOfWhite[2*i-1],locationMatrixOfWhite[2*i],3,ithStateOfBoard]=1;
      end
  end

  for i=1:div(size(locationMatrixOfBlack,2),2)
      if(LibertyValueOfBlackStone[1,i]==0)
          GoBoardWithSevenChannel[locationMatrixOfBlack[2*i-1],locationMatrixOfBlack[2*i],:,ithStateOfBoard]=0;
      elseif(LibertyValueOfBlackStone[1,i]==1)
          GoBoardWithSevenChannel[locationMatrixOfBlack[2*i-1],locationMatrixOfBlack[2*i],4,ithStateOfBoard]=1;
      elseif(LibertyValueOfBlackStone[1,i]==2)
          GoBoardWithSevenChannel[locationMatrixOfBlack[2*i-1],locationMatrixOfBlack[2*i],5,ithStateOfBoard]=1;
      elseif(LibertyValueOfBlackStone[1,i]>=3)
          GoBoardWithSevenChannel[locationMatrixOfBlack[2*i-1],locationMatrixOfBlack[2*i],6,ithStateOfBoard]=1;
      end
    end

  for i=1:div(size(locationMatrixOfGeneral,2),2)
      GoBoardWithSevenChannel[locationMatrixOfGeneral[2*i-1],locationMatrixOfGeneral[2*i],7,ithStateOfBoard]=1;
  end
end
function EdgeEncoding(x,padding)
    paddedX=zeros(size(x,1)+2*padding,size(x,2)+2*padding,size(x,3));
    for i=1+padding:size(paddedX,1)-padding
        for j=1+padding:size(paddedX,2)-padding
            paddedX[i,j,1:size(x,3)-1]=x[i-padding,j-padding,size(x,3)-1];
        end
    end
    paddedX[:,:,size(x,3)]=1;
    for i=1+padding:size(paddedX,1)-padding
        for j=1+padding:size(paddedX,2)-padding
            paddedX[i,j,size(x,3)]=0;
        end
    end
    return paddedX
end

output=EdgeEncoding(GoBoardWithSevenChannel,2);
