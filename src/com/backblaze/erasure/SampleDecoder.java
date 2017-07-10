/**
 * Command-line program that decodes a file using Reed-Solomon 4+2.
 *
 * Copyright 2015, Backblaze, Inc.  All rights reserved.
 */

package com.backblaze.erasure;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.ByteBuffer;

/**
 * Command-line program that decodes a file using Reed-Solomon 4+2.
 *
 * The file name given should be the name of the file to decode, say
 * "foo.txt".  This program will expected to find "foo.txt.0" through
 * "foo.txt.5", with at most two missing.  It will then write
 * "foo.txt.decoded".
 */
public class SampleDecoder {

    public static final int DATA_SHARDS = 4;
    public static final int PARITY_SHARDS = 2;
    public static final int TOTAL_SHARDS = 6;

    public static final int BYTES_IN_INT = 4;

    public  void decoder(String [] arguments,StringBuilder output) throws IOException {

        // Parse the command line
        if (arguments.length != 1) {
            System.out.println("Usage: SampleDecoder <fileName>");
            return;
        }
        final File originalFile = new File("/home/sriharsha/workspace_Neon/SER/ECC/"+arguments[0]);
        if (!originalFile.exists()) {
            System.out.println("Cannot read input file: " + originalFile);
            return;
        }

        // Read in any of the shards that are present.
        // (There should be checking here to make sure the input
        // shards are the same size, but there isn't.)
        final byte [] [] shards = new byte [TOTAL_SHARDS] [];
        final boolean [] shardPresent = new boolean [TOTAL_SHARDS];
        int shardSize = 0;
        int shardCount = 0;
        for (int i = 0; i < TOTAL_SHARDS; i++) {
        	
            File shardFile = new File("/home/sriharsha/workspace_Neon/SER/ECC/"+arguments[0]+ "." + i);
            if (shardFile.exists()) {
                shardSize = (int) shardFile.length();
                shards[i] = new byte [shardSize];
                shardPresent[i] = true;
                shardCount += 1;
                InputStream in = new FileInputStream(shardFile);
                in.read(shards[i], 0, shardSize);
                in.close();
                System.out.println("Read " + shardFile);
            }
        }

        // We need at least DATA_SHARDS to be able to reconstruct the file.
        if (shardCount < DATA_SHARDS) {
            System.out.println("Not enough shards present");
            output.append("Not enough shards present");
            return;
        }

        // Make empty buffers for the missing shards.
        for (int i = 0; i < TOTAL_SHARDS; i++) {
            if (!shardPresent[i]) {
                shards[i] = new byte [shardSize];
            }
        }

        // Use Reed-Solomon to fill in the missing shards
        ReedSolomon reedSolomon = new ReedSolomon(DATA_SHARDS, PARITY_SHARDS);
        reedSolomon.decodeMissing(shards, shardPresent, 0, shardSize);

        // Combine the data shards into one buffer for convenience.
        // (This is not efficient, but it is convenient.)
        byte [] allBytes = new byte [shardSize * DATA_SHARDS];
        for (int i = 0; i < DATA_SHARDS; i++) {
            System.arraycopy(shards[i], 0, allBytes, shardSize * i, shardSize);
        }

        
        
        // Extract the file length
        int fileSize = ByteBuffer.wrap(allBytes).getInt();
        /*for(int i=0;i<allBytes.length;i++)
        	if((allBytes[i]>=65&&allBytes[i]<=90)|| (allBytes[i]>=97&&allBytes[i]<=122)){
                if(i%4==0)System.out.println();
        		System.out.print(" "+(char)allBytes[i]);}
    	*/	   
        // Write the decoded file
        
        File decodedFile = new File("/home/sriharsha/workspace_Neon/SER/ECC", "encode" + ".decoded");
        OutputStream out = new FileOutputStream(decodedFile);
        out.write(allBytes, BYTES_IN_INT, fileSize);
        System.out.println("Wrote " + decodedFile);
        BufferedReader br = null;
		FileReader fr = null;

		try {

			fr = new FileReader("/home/sriharsha/workspace_Neon/SER/ECC/encode.decoded");
			br = new BufferedReader(fr);

			String sCurrentLine;

			br = new BufferedReader(new FileReader("/home/sriharsha/workspace_Neon/SER/ECC/encode.decoded"));
            
			while ((sCurrentLine = br.readLine()) != null) {
				output=output.append(sCurrentLine);
			}

		} catch (IOException e) {

			e.printStackTrace();

		} finally {

			try {

				if (br != null)
					br.close();

				if (fr != null)
					fr.close();

			} catch (IOException ex) {

				ex.printStackTrace();

			}

		}
        
        
        
        
    }
}
