#In this julia script the liberty value of a stone in the Go game is found
#According to 9 states that are obtained by the belonging location of the stone
#The states are related to stones' position in the board because the adjacent intersections'
#availability will be checked.
function LibertySolver(Coordinate, CoordinateOfGeneral)
  CoordinateOfGeneral=CoordinateOfGeneral;
  Coordinate=Coordinate;
  length=size(Coordinate,1);
  TheLocationsWillBeCheckedForCase1=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase2=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase3=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase4=round(Int64,zeros(1,6));
  TheLocationsWillBeCheckedForCase5=round(Int64,zeros(1,8));
  TheLocationsWillBeCheckedForCase6=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase7=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase8=round(Int64,zeros(1,4));
  TheLocationsWillBeCheckedForCase9=round(Int64,zeros(1,4));
  LibertyValueOfStone=round(Int64,zeros(1,round(Int64,size(Coordinate,1)/2)));
  HalfLengthOfCoordinate=size(CoordinateOfGeneral,1)/2;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
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
        LibertyValueOfStone[i]=4-count;
    end
  end
end

