/* Copyright (c) 2007 CSIRO
   Copyright (c) 2007-2008 Xiph.Org Foundation
   Written by Jean-Marc Valin */
/*
  Redistribution and use in source and binary forms, with or without
  modification, are permitted provided that the following conditions
  are met:
   
  - Redistributions of source code must retain the above copyright
  notice, this list of conditions and the following disclaimer.
   
  - Redistributions in binary form must reproduce the above copyright
  notice, this list of conditions and the following disclaimer in the
  documentation and/or other materials provided with the distribution.
   
  - Neither the name of the Xiph.org Foundation nor the names of its
  contributors may be used to endorse or promote products derived from
  this software without specific prior written permission.
   
  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
  ``AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE FOUNDATION OR
  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

module libcelt.celt_header;
import libcelt.celt;
import libcelt.celt_types;

extern (C) {

/** Header data to be used for Ogg files (or possibly other encapsulation) 
    @brief Header data 
*/
  struct CELTHeader {
    char         codec_id[8];       /**< MUST be "CELT    " (four spaces) */
    char         codec_version[20]; /**< Version used (as string) */
    celt_int32 version_id;        /**< Version id (negative for until stream is frozen) */
    celt_int32 header_size;       /**< Size of this header */
    celt_int32 sample_rate;       /**< Sampling rate of the original audio */
    celt_int32 nb_channels;       /**< Number of channels */
    celt_int32 frame_size;        /**< Samples per frame (per channel) */
    celt_int32 overlap;           /**< Overlapping samples (per channel) */
    celt_int32 bytes_per_packet;  /**< Number of bytes per compressed packet (0 if unknown) */
    celt_int32 extra_headers;     /**< Number of additional headers that follow this header */
  }

/** Creates a basic header struct */
  int celt_header_init(CELTHeader *header, const CELTMode *m, int channels);

  int celt_header_to_packet(const CELTHeader *header, ubyte *packet, celt_uint32 size);

  int celt_header_from_packet(const ubyte *packet, celt_uint32 size, CELTHeader *header);
}
